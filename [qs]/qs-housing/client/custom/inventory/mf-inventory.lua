--[[
    Here you have the configuration of stashes, you can modify it or even
    create your own! In case your inventory is not here, you can ask the
    creator to create a file following this example and add it!
]]

if Config.Inventory ~= 'mf_inventory' then
    return
end

function HousingStash(id, other, mlo)
    local uniqueIdentifier = 'houseUniqueIdentifier:' .. id
    local inventoryType = 'inventory'
    local inventorySubType = 'housing'
    local inventoryLabel = 'house_storage'
    local maxWeight, maxSlots
    if mlo then -- For MLO stashes
        maxWeight = 50000
        maxSlots = 75
    else -- For IPL and Shell stashes
        maxWeight = other.weight
        maxSlots = other.slots
    end

    TriggerServerEvent('mf-inventory:server:createHousingInventory', uniqueIdentifier, inventoryType, inventorySubType, inventoryLabel, maxWeight, maxSlots)
    exports['mf-inventory']:openOtherInventory(uniqueIdentifier)
end

--[[
    Furniture stash system, choose your own weight and slots!
]]

ObjectStash = {
    [`apa_mp_h_str_sideboardl_06`] = { weight = 1500, slots = 6 },
    [`apa_mp_h_str_sideboardm_03`] = { weight = 1500, slots = 6 },
    [`apa_mp_h_str_sideboardl_09`] = { weight = 1500, slots = 3 },
    [`ex_prop_ex_toolchest_01`] = { weight = 1500, slots = 6 },
    [`gr_prop_gr_tool_chest_01a`] = { weight = 1500, slots = 6 },
    [`gr_prop_gr_tool_draw_01a`] = { weight = 1500, slots = 3 },
    [`gr_prop_gr_tool_draw_01b`] = { weight = 1500, slots = 6 },
    [`gr_prop_gr_tool_draw_01d`] = { weight = 1500, slots = 6 },
    [`apa_mp_h_bed_chestdrawer_02`] = { weight = 1500, slots = 3 },
    [`apa_mp_h_str_sideboardl_14`] = { weight = 1500, slots = 6 },
    [`apa_mp_h_str_sideboardl_13`] = { weight = 1500, slots = 6 },
    [`apa_mp_h_str_sideboardm_02`] = { weight = 1500, slots = 3 },
    [`apa_mp_h_str_sideboards_02`] = { weight = 1500, slots = 6 },
    [`hei_heist_bed_chestdrawer_04`] = { weight = 1500, slots = 6 },
    [`hei_heist_str_sideboardl_02`] = { weight = 1500, slots = 3 },
    [`p_v_43_safe_s`] = { weight = 1500, slots = 6 },
}
