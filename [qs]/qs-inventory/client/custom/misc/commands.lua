RegisterNetEvent(Config.InventoryPrefix .. ':client:openVending')
AddEventHandler(Config.InventoryPrefix .. ':client:openVending', function(Data)
    local Category = Data['category']
    local ShopItems = {}
    ShopItems['label'] = Config.VendingMachines[Category]['Label']
    ShopItems['items'] = Config.VendingMachines[Category]['Items']
    ShopItems['slots'] = #Config.VendingMachines[Category]['Items']
    TriggerServerEvent(Config.InventoryPrefix .. ':server:OpenInventory', 'shop', Config.VendingMachines[Category]['Label'] .. '_' .. math.random(1, 99), ShopItems)
end)

local spamCount = 0
local lastSpamId = nil

RegisterCommand('inventory', function()
    if IsNuiFocused() then return Debug('NUI Focused') end
    if spamCount > 2 then
        SendTextMessage(Lang('INVENTORY_NOTIFICATION_SPAM'), 'error')
        return
    end
    spamCount = spamCount + 1
    lastSpamId = math.random(1, 999999)
    local spamId = lastSpamId
    SetTimeout(1000, function()
        if spamId == lastSpamId then
            spamCount = 0
        end
    end)
    if LocalPlayer.state.inv_busy or not IsPlayerDead() then
        Warning("You can't use this action because inv_busy is active (avoids dupes)")
        return SendTextMessage(Lang('INVENTORY_NOTIFICATION_NOT_ACCESSIBLE'), 'error')
    end

    if inInventory and not IsNuiFocused() then
        SetNuiFocus(true, true)
        return
    end

    if not isCrafting and not inInventory and not inventoryDisabled then
        if not IsPauseMenuActive() then
            local ped = PlayerPedId()
            local curVeh = nil
            local VendingMachine = nil
            local garbage = nil
            local CurrentGarbage = {}
            local entity, entityModel, data = GetNearbyGarbage()
            if entity then
                local x, y, z = table.unpack(GetEntityCoords(entity))
                local _, floorZ = GetGroundZFor_3dCoord(x, y, z, false)
                garbage = getOwnerFromCoordsForGarbage(vector3(x, y, floorZ))
                CurrentGarbage.label = data.label
                CurrentGarbage.items = data.items
                CurrentGarbage.slots = data.slots
            end

            if not Config.UseTarget or Config.UseTarget == 'none' then
                VendingMachine = GetClosestVending()
            end

            if IsPedInAnyVehicle(ped, false) then -- Is Player In Vehicle
                local vehicle = GetVehiclePedIsIn(ped, false)
                CurrentGlovebox = Trim(GetVehicleNumberPlateText(vehicle))
                curVeh = vehicle
                CurrentVehicle = nil
            else
                local vehicle = getClosestVehicle()
                if vehicle ~= 0 and vehicle ~= nil then
                    local pos = GetEntityCoords(ped)
                    local dimensionMin, dimensionMax = GetModelDimensions(GetEntityModel(vehicle))
                    local trunkpos = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, (dimensionMin.y), 0.0)
                    if (IsBackEngine(GetEntityModel(vehicle))) then
                        trunkpos = GetOffsetFromEntityInWorldCoords(vehicle, 0.0, (dimensionMax.y), 0.0)
                    end
                    if #(pos - trunkpos) < 1.5 and not IsPedInAnyVehicle(ped) then
                        if GetVehicleDoorLockStatus(vehicle) < 2 then
                            CurrentVehicle = Trim(GetVehicleNumberPlateText(vehicle))
                            curVeh = vehicle
                            CurrentGlovebox = nil
                        else
                            SendTextMessage(Lang('INVENTORY_NOTIFICATION_VEHICLE_LOCKED'), 'error')
                            return
                        end
                    else
                        CurrentVehicle = nil
                    end
                else
                    CurrentVehicle = nil
                end
            end

            if CurrentVehicle then -- Trunk
                local vehicleClass = GetVehicleClass(curVeh)
                Debug('Current vehicleClass of the vehicle that is being unlocked:', vehicleClass)
                local maxweight = Config.VehicleClass[vehicleClass].trunk.maxweight or 60000
                local slots = Config.VehicleClass[vehicleClass].trunk.slots or 35
                local isCustomVehicle = Config.CustomTrunk[GetEntityModel(curVeh)]

                if isCustomVehicle then
                    maxweight = isCustomVehicle.maxweight
                    slots = isCustomVehicle.slots
                end

                local other = {
                    maxweight = maxweight,
                    slots = slots,
                }
                TriggerServerEvent(Config.InventoryPrefix .. ':server:OpenInventory', 'trunk', CurrentVehicle, other)
                OpenTrunk()
            elseif CurrentGlovebox then
                local vehicleClass = GetVehicleClass(curVeh)
                Debug('Current vehicleClass of the vehicle that is being unlocked:', vehicleClass)
                local maxweight = Config.VehicleClass[vehicleClass].glovebox.maxweight or 60000
                local slots = Config.VehicleClass[vehicleClass].glovebox.slots or 35
                local isCustomVehicle = Config.CustomGlovebox[GetEntityModel(curVeh)]

                if isCustomVehicle then
                    maxweight = isCustomVehicle.maxweight
                    slots = isCustomVehicle.slots
                end
                local other = {
                    maxweight = maxweight,
                    slots = slots
                }
                TriggerServerEvent(Config.InventoryPrefix .. ':server:OpenInventory', 'glovebox', CurrentGlovebox, other)
            elseif CurrentDrop ~= 0 then
                TriggerServerEvent(Config.InventoryPrefix .. ':server:OpenInventory', 'drop', CurrentDrop)
            elseif garbage then
                TriggerServerEvent(Config.InventoryPrefix .. ':server:OpenInventory', 'garbage', garbage, CurrentGarbage, entityModel)
                OpenGarbage()
            elseif VendingMachine then
                local vendingCategory = nil
                local vendingModel = GetEntityModel(VendingMachine)
                for _, vendingData in pairs(Config.Vendings) do
                    local vendingDataModel = GetHashKey(vendingData.Model)
                    if vendingDataModel == vendingModel then
                        vendingCategory = vendingData.Category
                        break
                    end
                end
                if vendingCategory then
                    TriggerEvent(Config.InventoryPrefix .. ':client:openVending', { category = vendingCategory })
                end
            else
                OpenAnim()
                TriggerServerEvent(Config.InventoryPrefix .. ':server:OpenInventory')
            end
        end
    end
end, false)

RegisterKeyMapping('inventory', Lang('INVENTORY_KEYMAPPING_OPEN_LABEL'), 'keyboard', Config.KeyBinds.inventory)

RegisterNetEvent(Config.InventoryPrefix .. ':client:OpenPlayerInventory')
AddEventHandler(Config.InventoryPrefix .. ':client:OpenPlayerInventory', function()
    ExecuteCommand('inventory')
end)

RegisterCommand('hotbar', function()
    if inventoryDisabled then return end
    if IsNuiFocused() then return end
    if LocalPlayer.state.inv_busy or not IsPlayerDead() then
        Warning("You can't use this action because inv_busy is active (avoids dupes)")
        return SendTextMessage(Lang('INVENTORY_NOTIFICATION_NOT_ACCESSIBLE'), 'error')
    end

    isHotbar = not isHotbar
    if not IsPauseMenuActive() then
        ToggleHotbar(isHotbar)
    end
end, false)

RegisterKeyMapping('hotbar', Lang('INVENTORY_KEYMAPPING_HOTBAR_LABEL'), 'keyboard', Config.KeyBinds.hotbar)

RegisterCommand('reloadweapon', function()
    if not CurrentWeaponData?.name then return end
    local weaponData = WeaponList[joaat(CurrentWeaponData?.name)]
    if not weaponData then return end

    if LocalPlayer.state.inv_busy or not IsPlayerDead() then
        Debug("You can't use this action because inv_busy is active (avoids dupes)")
        return SendTextMessage(Lang('INVENTORY_NOTIFICATION_NOT_ACCESSIBLE'), 'error')
    end
    TriggerServerCallback('weapons:GetWeaponAmmoItem', function(item)
        if not item then return end
        TriggerEvent('weapons:client:AddAmmo', weaponData.ammotype, GetWeaponClipSize(joaat(CurrentWeaponData?.name)), item)
    end, weaponData.ammotype)
end, false)

RegisterKeyMapping('reloadweapon', Lang('INVENTORY_KEYMAPPING_RELOAD_LABEL'), 'keyboard', Config.KeyBinds.reload)
