local GARAGE_TYPE = "owned_garage"

local function openPlayerVehicles(markerId)
    TriggerServerCallback(Utils.eventsPrefix .. ':garage_owned:getVehicles', function(vehicles, spawnPoints)
        local plyPed = PlayerPedId()
        
        local elements = {}

        for k, vehicleData in pairs(vehicles) do
            local vehicleProps = {}
            local vehicleName = nil
            local isVehicleOutside = nil

            if(Framework.getFramework() == "ESX") then
                vehicleProps = json.decode(vehicleData.vehicle)
                vehicleName = vehicleProps.model
                isVehicleOutside = vehicleData.stored == 0 or not vehicleData.stored
            elseif(Framework.getFramework() == "QB-core") then
                vehicleProps = json.decode(vehicleData.mods)
                vehicleName = vehicleData.vehicle
                isVehicleOutside = vehicleData.state == 0 or not vehicleData.state
            end            

            local vehicleLabel = getVehicleNameFromModel(vehicleName)

            if(vehicleData.plate) then
                vehicleLabel = vehicleLabel .. " - " .. vehicleData.plate 
            end

            if(isVehicleOutside) then
                vehicleLabel =  getLocalizedText('buyable_vehicle:outside', vehicleLabel)
            end

            table.insert(elements, {
                label = vehicleLabel,
                vehicleName = vehicleProps.model,
                vehicleProps = vehicleProps,
                vehiclePlate = vehicleData.plate,
                isOutside = isVehicleOutside
            })
        end

        if(#elements == 0) then
            table.insert(elements, {label = getLocalizedText('no_vehicles_in_garage')})
        end

        Framework.menu().CloseAll()

        Framework.menu().Open('default', GetCurrentResourceName(), 'job_garage_owned', {
            title = getLocalizedText('garage'),
            align = config.menuPosition,
            elements = elements
        },
        function(data, menu)
            local vehicleName = data.current.vehicleName
            
            if(not vehicleName) then return end

            if(data.current.isOutside) then
                notifyClient(getLocalizedText('vehicle_outside'))
                return
            end
            
            local vehicleProps = data.current.vehicleProps
            local vehicleId = data.current.vehicleId
            local vehiclePlate = data.current.vehiclePlate

            local freeSpawnpointData = getFreeSpawnpoint(spawnPoints)
            if(not freeSpawnpointData) then notifyClient(getLocalizedText("no_free_spawnpoints")) return end

            openedMenu = nil
            Framework.menu().CloseAll()

            RequestModel(vehicleName)

            while not HasModelLoaded(vehicleName) do Citizen.Wait(0) end

            local vehicle = CreateVehicle(vehicleName, freeSpawnpointData.coords, freeSpawnpointData.heading, true, false)

            TriggerServerEvent(Utils.eventsPrefix .. ':garage_owned:spawnedVehicle', vehiclePlate)

            SetEntityAsMissionEntity(vehicle, true, true)
            
            Framework.setVehicleProperties(vehicle, vehicleProps)

            if(vehiclePlate) then
                SetVehicleNumberPlateText(vehicle, vehiclePlate)
            end

            TaskEnterVehicle(plyPed, vehicle, 1000, -1, 2.0, 16, 0)

            TriggerEvent(Utils.eventsPrefix .. ":garage_owned:vehicleSpawned", vehicle, vehicleName, GetVehicleNumberPlateText(vehicle))

            addVehicleToOutsideVehicles(GARAGE_TYPE, vehicle)
        end,
        function(data, menu)
            openedMenu = nil
            menu.close()
        end)
    end, markerId)
end

function openGarageOwned(markerId)
    local plyPed = PlayerPedId()

    Framework.menu().CloseAll()

    local elements = {
        {label = getLocalizedText('garage'), value = "garage"},
        {label = getLocalizedText('park_vehicle'), value = "deposit"}
    }

    Framework.menu().Open('default', GetCurrentResourceName(), 'garage_owned_options', {
        title = getLocalizedText('garage'),
        align = config.menuPosition,
        elements = elements
    },
    function(data, menu)
        local action = data.current.value

        if(action == "garage") then
            openPlayerVehicles(markerId)
        elseif(action == "deposit") then
            local vehicleToDelete = IsPedInAnyVehicle(plyPed, false) and GetVehiclePedIsIn(plyPed, false) or getOutsideVehicleInRange(GARAGE_TYPE)

            if(DoesEntityExist(vehicleToDelete)) then
                local props = Framework.getVehicleProperties(vehicleToDelete)
                local plate = GetVehicleNumberPlateText(vehicleToDelete)
                local vehicleModel = GetEntityModel(vehicleToDelete)

                TriggerServerCallback(Utils.eventsPrefix .. ':garage_owned:updateVehicleProps', function(isSuccessful) 
                    if(isSuccessful) then
                        if(DoesEntityExist(vehicleToDelete)) then
                            Framework.deleteVehicle(vehicleToDelete)
            
                            deleteVehicleFromOutsideVehicles(GARAGE_TYPE, vehicleToDelete)

                            TriggerEvent(Utils.eventsPrefix .. ":garage_owned:vehicleParked", vehicleModel, plate)

                            openedMenu = nil
                            menu.close()
                        end
                    end
                end, markerId, props, plate)
            else
                notifyClient(getLocalizedText("no_car_found")) 
            end
        end
    end,
    function(data, menu)
        openedMenu = nil
        menu.close()
    end)
end