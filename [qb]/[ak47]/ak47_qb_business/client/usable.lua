local IsAnimated = false

RegisterNetEvent('ak47_qb_business:onEat')
AddEventHandler('ak47_qb_business:onEat', function(data)
    local data = data
    if not IsAnimated then
        IsAnimated = true
        local playerPed = PlayerPedId()
        if data then
            TriggerServerEvent('ak47_qb_business:removeItem', data.item)
            
            if data.prepare then
                ExecuteCommand('e '..data.prepare.emote)
                TriggerEvent('ak47_qb_business:progress', _U('preparing'), data.prepare.delay)
                Citizen.Wait(data.prepare.delay)
            end

            if data.hunger then
                TriggerEvent('ak47_qb_business:progress', _U('eating'), data.hunger.delay)
                if data.hunger.emote then
                    ExecuteCommand('e '..data.hunger.emote)
                end
                if data.hunger.add then
                    local div = (data.hunger.add or 0) / (data.hunger.delay / 1000)
                    while data.hunger.delay >= 0 do
                        Citizen.Wait(1000)
                        data.hunger.delay = data.hunger.delay - 1000
                        TriggerServerEvent("ak47_qb_business:SetMetaData", 'hunger', QBCore.Functions.GetPlayerData().metadata['hunger'] + div)
                    end
                else
                    local div = (data.hunger.remove or 0) / (data.hunger.delay / 1000)
                    while data.hunger.delay >= 0 do
                        Citizen.Wait(1000)
                        data.hunger.delay = data.hunger.delay - 1000
                        TriggerServerEvent("ak47_qb_business:SetMetaData", 'hunger', QBCore.Functions.GetPlayerData().metadata['hunger'] - div)
                    end
                end
            end

            if data.thirst then
                TriggerEvent('ak47_qb_business:progress', _U('drinking'), data.thirst.delay)
                if data.thirst.emote then
                    ExecuteCommand('e '..data.thirst.emote)
                end
                if data.thirst.add then
                    local div = (data.thirst.add or 0) / (data.thirst.delay / 1000)
                    while data.thirst.delay >= 0 do
                        Citizen.Wait(1000)
                        data.thirst.delay = data.thirst.delay - 1000
                        TriggerServerEvent("ak47_qb_business:SetMetaData", 'thirst', QBCore.Functions.GetPlayerData().metadata['thirst'] + div)
                    end
                else
                    local div = (data.thirst.remove or 0) / (data.thirst.delay / 1000)
                    while data.thirst.delay >= 0 do
                        Citizen.Wait(1000)
                        data.thirst.delay = data.thirst.delay - 1000
                        TriggerEvent('esx_status:remove', 'thirst', div)
                        TriggerServerEvent("ak47_qb_business:SetMetaData", 'thirst', QBCore.Functions.GetPlayerData().metadata['thirst'] - div)
                    end
                end
            end

            ExecuteCommand('emotecancel')
            IsAnimated = false
        else
            local playerPed = PlayerPedId()
            QBCore.Functions.RequestAnimDict('mp_player_inteat@burger')
            TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8, -1, 49, 0, 0, 0, 0)
            Citizen.Wait(3000)
            IsAnimated = false
            ClearPedSecondaryTask(playerPed)
        end
    end
end)

RegisterNetEvent('ak47_qb_business:onDrink')
AddEventHandler('ak47_qb_business:onDrink', function()
    if not IsAnimated then
        IsAnimated = true
        Citizen.CreateThread(function()
            local playerPed = PlayerPedId()
            QBCore.Functions.RequestAnimDict('mp_player_intdrink')
            TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, 2000, 49, 0, 0, 0, 0)
            Citizen.Wait(3000)
            IsAnimated = false
            ClearPedSecondaryTask(playerPed)
        end)
    end
end)

RegisterNetEvent('ak47_qb_business:add')
AddEventHandler('ak47_qb_business:add', function(type, value)
    TriggerServerEvent("ak47_qb_business:SetMetaData", type, QBCore.Functions.GetPlayerData().metadata[type] + value)
end)
