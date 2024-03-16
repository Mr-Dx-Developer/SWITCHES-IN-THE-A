--[[
    Here you have the wardrobe configuration, you can modify it or even
    create your own! In case your inventory is not here, you can ask the
    creator to create a file following this example and add it!
]]

if Config.Wardrobe ~= 'fivem-appearance' then
    return
end

function OpenClotheMenu()
    exports['fivem-appearance']:openWardrobe()
end

Config.ObjectWardrobe = {
    [`ch_prop_ch_service_locker_01a`] = true,
    [`ch_prop_ch_service_locker_02a`] = true,
    [`apa_mp_h_str_shelffloorm_02`] = true,
    [`apa_mp_h_str_shelffreel_01`] = true,
    [`bkr_prop_gunlocker_01a`] = true,
    [`apa_mp_h_str_shelfwallm_01`] = true,
    [`v_serv_cupboard_01`] = true,
}
