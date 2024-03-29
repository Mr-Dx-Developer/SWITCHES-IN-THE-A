--[[
    Here you have the wardrobe configuration, you can modify it or even
    create your own! In case your inventory is not here, you can ask the
    creator to create a file following this example and add it!
]]

if Config.Wardrobe ~= 'esx_skin' then
    return
end

function OpenClotheMenu()
    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'room', {
        title    = Lang('HOUSING_MENU_WARDROBE_TITLE'),
        align    = 'right',
        elements = {
            { label = Lang('HOUSING_MENU_CLOTHES_MENU'),   value = 'player_dressing' },
            { label = Lang('HOUSING_MENU_DELETE_CLOTHES'), value = 'remove_cloth' }
        }
    }, function(data, menu)
        if data.current.value == 'player_dressing' then
            menu.close()
            TriggerServerCallback('housing:server:getPlayerDressing', function(dressing)
                elements = {}

                for i = 1, #dressing, 1 do
                    table.insert(elements, {
                        label = dressing[i],
                        value = i
                    })
                end

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'player_dressing',
                    {
                        title    = Lang('HOUSING_MENU_CLOTHES_MENU'),
                        align    = 'right',
                        elements = elements
                    }, function(data2, menu2)
                        TriggerEvent('skinchanger:getSkin', function(skin)
                            TriggerServerCallback('housing:server:getPlayerOutfit', function(clothes)
                                TriggerEvent('skinchanger:loadClothes', skin, clothes)
                                TriggerEvent('esx_skin:setLastSkin', skin)

                                TriggerEvent('skinchanger:getSkin', function(skin)
                                    TriggerServerEvent('esx_skin:save', skin)
                                end)
                            end, data2.current.value)
                        end)
                    end, function(data2, menu2)
                        menu2.close()
                    end)
            end)
        elseif data.current.value == 'remove_cloth' then
            menu.close()
            TriggerServerCallback('housing:server:getPlayerDressing', function(dressing)
                elements = {}

                for i = 1, #dressing, 1 do
                    table.insert(elements, {
                        label = dressing[i],
                        value = i
                    })
                end

                ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'remove_cloth', {
                    title    = Lang('HOUSING_MENU_DELETE_CLOTHES'),
                    align    = 'right',
                    elements = elements
                }, function(data2, menu2)
                    menu2.close()
                    TriggerServerEvent('housing:server:removeOutfit', data2.current.value)
                    SendTextMessage(Lang('HOUSING_NOTIFICATION_OUTFIT_DELETE'), 'inform')
                end, function(data2, menu2)
                    menu2.close()
                end)
            end)
        end
    end, function(data, menu)
        menu.close()
    end)
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
