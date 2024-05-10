if Config.Menu ~= 'esx_menu_default' then
    return
end

function CreateBackpack(ID)
    ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'create_password',
        {
            title = Lang('CREATE_PASSWORD'),
        }, function(data, menu)
            local length = string.len(data.value)
            if length <= 0 then
                SendTextMessage(Lang('BAD_PASSWORD'), 'error')
            elseif length < Config.PasswordLength.min then
                SendTextMessage(Lang('MORE_PASSWORD'), 'error')
            elseif length > Config.PasswordLength.max then
                SendTextMessage(Lang('LESS_PASSWORD'), 'error')
            else
                SendTextMessage(Lang('ADDED_PASSWORD'), 'success')
                TriggerServerEvent('backpacks:server:add_password', { ID = ID, password = data.value })
                menu.close()
            end
        end, function(data, menu)
            menu.close()
        end)
end

function CheckMeta(backpack_metadata)
    if backpack_metadata.locked then
        ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'enter_password',
            {
                title = Lang('INTRODUCE_PASSWORD'),
            }, function(data, menu)
                if backpack_metadata.password == data.value then
                    menu.close()
                    backpack_metadata.trypassword = data.value
                    OpenBackpack(backpack_metadata)
                else
                    SendTextMessage(Lang('BAD_PASSWORD'), 'error')
                    menu.close()
                end
            end, function(data, menu)
                menu.close()
            end)
    else
        OpenBackpack(backpack_metadata)
    end
end
