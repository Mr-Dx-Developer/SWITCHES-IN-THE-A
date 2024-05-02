if Config.Menu ~= 'ox_lib' then
    return
end

function CreateBackpack(ID)
    if not lib then
        print('You need to uncomment the ox_lib export on line 10 of qs-backpacks/fxmanifest.lua')
        return
    end
    local keyboard1 = lib.inputDialog(Lang('CREATE_PASSWORD') .. ' Min ' .. Config.PasswordLength.min .. ' Max ' .. Config.PasswordLength.max, { Lang('INTRODUCE_PASSWORD_2') })
    if not keyboard1 then return end

    local pass = tostring(keyboard1[1])
    local length = string.len(pass)
    if length <= 0 then
        SendTextMessage(Lang('BAD_PASSWORD'), 'error')
        return
    end
    if length < Config.PasswordLength.min then
        SendTextMessage(Lang('MORE_PASSWORD'), 'error')
        return
    end
    if length > Config.PasswordLength.max then
        SendTextMessage(Lang('LESS_PASSWORD'), 'error')
        return
    end

    SendTextMessage(Lang('ADDED_PASSWORD'), 'success')
    TriggerServerEvent('backpacks:server:add_password', { ID = ID, password = pass })
end

function CheckMeta(backpack_metadata)
    if backpack_metadata.locked then
        if not lib then
            print('You need to uncomment the ox_lib export on line 10 of qs-backpacks/fxmanifest.lua')
            return
        end
        local data = lib.inputDialog(Lang('INTRODUCE_PASSWORD'), { Lang('INTRODUCE_PASSWORD_2') })
        if not data then
            SendTextMessage(Lang('BAD_PASSWORD'), 'error')
            return
        end
        backpack_metadata.trypassword = data[1]
        OpenBackpack(backpack_metadata)
    else
        OpenBackpack(backpack_metadata)
    end
end
