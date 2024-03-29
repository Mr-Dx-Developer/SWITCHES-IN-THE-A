--[[
    Here you have the configuration of stashes, you can modify it or even
    create your own! In case your inventory is not here, you can ask the
    creator to create a file following this example and add it!
]]

if Config.Inventory ~= 'esx_inventory' then
    return
end

function HousingStash()
    ESX.UI.Menu.CloseAll()
    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'storage',
        {
            title = Lang('HOUSING_MENU_STASH_TITLE'),
            align = 'right',
            elements = {

                { label = Lang('HOUSING_MENU_STASH_ITEMS'),      value = 'i' },
                { label = Lang('HOUSING_MENU_STASH_WEAPONS'),    value = 'w' },
                { label = Lang('HOUSING_MENU_BLACK_MONEY_NAME'), value = 'b' }
            },
        },
        function(data, menu)
            if data.current.value == 'i' then
                ItemStorage()
            elseif data.current.value == 'w' then
                WeaponStorage()
            elseif data.current.value == 'b' then
                BlackMoneyStorage()
            end
        end,
        function(data, menu)
            menu.close()
        end)
end

function BlackMoneyStorage()
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'storage',
        {
            title = Lang('HOUSING_MENU_BLACK_MONEY'),
            align = 'right',
            elements = {
                { label = Lang('HOUSING_MENU_STASH_STORE'),    value = 's' },
                { label = Lang('HOUSING_MENU_STASH_WITHDRAW'), value = 'w' }
            },
        },
        function(data, menu)
            if data.current.value == 's' then
                ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'putAmount', { title = Lang('HOUSING_MENU_BLACK_MONEY_AMOUNT') }, function(data3, menu3)
                    local amount = tonumber(data3.value)

                    if amount == nil then
                        SendTextMessage(Lang('HOUSING_NOTIFICATION_INVALID_AMOUNT'), 'error')
                    else
                        if amount >= 0 then
                            TriggerServerCallback('housing:server:depositBlackMoney', function(success)
                                if success then
                                    SendTextMessage(Lang('HOUSING_NOTIFICATION_BLACK_MONEY_SUCCESS'), 'success')
                                else
                                    SendTextMessage(Lang('HOUSING_NOTIFICATION_CANT_AFFORD_2'), 'error')
                                end
                            end, amount)
                            menu3.close()
                        else
                            SendTextMessage(Lang('HOUSING_NOTIFICATION_INVALID_AMOUNT'), 'error')
                        end
                    end
                end, function(data3, menu3)
                    menu3.close()
                end)
            elseif data.current.value == 'w' then
                TriggerServerCallback('housing:server:getBlackMoney', function(count)
                    local elements = {}

                    table.insert(elements, { label = Lang('HOUSING_MENU_BLACK_MONEY_NAME') .. ' $' .. count, value = 'black_money' })

                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'withdrawItem', {
                        title = Lang('HOUSING_MENU_BLACK_MONEY_WITHDRAW'),
                        align = 'right',
                        elements = elements
                    }, function(data2, menu2)
                        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'putAmount', { title = Lang('HOUSING_MENU_BLACK_MONEY_AMOUNT') }, function(data3, menu3)
                            local amount = tonumber(data3.value)

                            if amount == nil then
                                SendTextMessage(Lang('HOUSING_NOTIFICATION_INVALID_AMOUNT'), 'error')
                            else
                                if amount >= 0 then
                                    TriggerServerCallback('housing:server:withdrawBlackMoney', function(success)
                                        if success then
                                            SendTextMessage(Lang('HOUSING_NOTIFICATION_BLACK_MONEY_SUCCESS_WITHDRAW'), 'success')
                                        else
                                            SendTextMessage(Lang('HOUSING_NOTIFICATION_CANT_AFFORD_2'), 'error')
                                        end
                                    end, amount)
                                    menu3.close()
                                    menu2.close()
                                else
                                    SendTextMessage(Lang('HOUSING_NOTIFICATION_INVALID_AMOUNT'), 'error')
                                end
                            end
                        end, function(data3, menu3)
                            menu3.close()
                        end)
                    end, function(data2, menu2)
                        menu2.close()
                    end)
                end, id)
            end
        end, function(data, menu)
            menu.close()
        end)
end

function ItemStorage(id)
    ESX.UI.Menu.CloseAll()

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'storage',
        {
            title = Lang('HOUSING_MENU_STASH_TITLE'),
            align = 'right',
            elements = {
                { label = Lang('HOUSING_MENU_STASH_STORE'),    value = 's' },
                { label = Lang('HOUSING_MENU_STASH_WITHDRAW'), value = 'w' }
            },
        },
        function(data, menu)
            if data.current.value == 's' then
                TriggerServerCallback('housing:server:getInventory', function(inv)
                    local elements = {}

                    for k, v in pairs(inv['items']) do
                        if v['count'] >= 1 then
                            table.insert(elements, { label = ('x%s %s'):format(v['count'], v['label']), type = 'item', value = v['name'] })
                        end
                    end

                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'storeItem', {
                        title = Lang('HOUSING_MENU_PLAYER_INVENTORY'),
                        align = 'right',
                        elements = elements
                    }, function(data2, menu2)
                        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'putAmount', { title = 'Amount' }, function(data3, menu3)
                            local amount = tonumber(data3.value)

                            if amount == nil then
                                SendTextMessage(Lang('HOUSING_NOTIFICATION_INVALID_AMOUNT'), 'error')
                            else
                                if amount >= 0 then
                                    TriggerServerEvent('housing:server:storeItem', data2.current.type, data2.current.value, tonumber(data3.value), id)
                                    menu3.close()
                                    menu2.close()
                                else
                                    SendTextMessage(Lang('HOUSING_NOTIFICATION_INVALID_AMOUNT'), 'error')
                                end
                            end
                        end, function(data3, menu3)
                            menu3.close()
                        end)
                    end, function(data2, menu2)
                        menu2.close()
                    end)
                end)
            elseif data.current.value == 'w' then
                TriggerServerCallback('housing:server:getHouseInventory', function(inv)
                    local elements = {}

                    for k, v in pairs(inv['items']) do
                        if v['count'] > 0 then
                            table.insert(elements, { label = ('x%s %s'):format(v['count'], v['label']), value = v['name'] })
                        end
                    end

                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'withdrawItem', {
                        title = Lang('HOUSING_MENU_HOUSE_INVENTORY'),
                        align = 'right',
                        elements = elements
                    }, function(data2, menu2)
                        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'putAmount', { title = 'Amount' }, function(data3, menu3)
                            local amount = tonumber(data3.value)

                            if amount == nil then
                                SendTextMessage(Lang('HOUSING_NOTIFICATION_INVALID_AMOUNT'), 'error')
                            else
                                if amount >= 0 then
                                    TriggerServerEvent('housing:server:withdrawItem', 'item', data2.current.value, tonumber(data3.value), id)
                                    menu3.close()
                                    menu2.close()
                                else
                                    SendTextMessage(Lang('HOUSING_NOTIFICATION_INVALID_AMOUNT'), 'error')
                                end
                            end
                        end, function(data3, menu3)
                            menu3.close()
                        end)
                    end, function(data2, menu2)
                        menu2.close()
                    end)
                end, id)
            end
        end, function(data, menu)
            menu.close()
        end)
end

function WeaponStorage(id)
    ESX.UI.Menu.CloseAll()
    TriggerServerCallback('housing:server:getInventory', function(inv)
        local elements = {}

        for k, v in pairs(inv['weapons']) do
            table.insert(elements, { label = v['label'], weapon = v['name'], ammo = v['ammo'] })
        end
    end)

    ESX.UI.Menu.Open(
        'default', GetCurrentResourceName(), 'storage',
        {
            title = Lang('HOUSING_MENU_STASH_TITLE'),
            align = 'right',
            elements = {
                { label = Lang('HOUSING_MENU_STASH_STORE'),    value = 's' },
                { label = Lang('HOUSING_MENU_STASH_WITHDRAW'), value = 'w' }
            },
        },
        function(data, menu)
            if data.current.value == 's' then
                TriggerServerCallback('housing:server:getInventory', function(inv)
                    local elements = {}

                    for k, v in pairs(inv['weapons']) do
                        table.insert(elements, { label = v['label'], weapon = v['name'], ammo = v['ammo'] })
                    end

                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'storeItem', {
                        title = Lang('HOUSING_MENU_HOUSE_INVENTORY'),
                        align = 'right',
                        elements = elements
                    }, function(data2, menu2)
                        TriggerServerEvent('housing:server:storeItem', 'weapon', data2.current.weapon, data2.current.ammo, id)
                        menu2.close()
                    end, function(data2, menu2)
                        menu2.close()
                    end)
                end)
            elseif data.current.value == 'w' then
                TriggerServerCallback('housing:server:getHouseInventory', function(inv)
                    local elements = {}

                    for k, v in pairs(inv['weapons']) do
                        table.insert(elements, { label = ('%s | x%s %s'):format(ESX.GetWeaponLabel(v['name']), v['ammo'], 'bullets'), weapon = v['name'], ammo = v['ammo'] })
                    end

                    ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'withdrawItem', {
                        title = Lang('HOUSING_MENU_HOUSE_INVENTORY'),
                        align = 'right',
                        elements = elements
                    }, function(data2, menu2)
                        TriggerServerEvent('housing:server:withdrawItem', 'weapon', data2.current.weapon, data2.current.ammo, id)
                        menu2.close()
                    end, function(data2, menu2)
                        menu2.close()
                    end)
                end, id)
            end
        end, function(data, menu)
            menu.close()
        end)
end

ObjectStash = {}
