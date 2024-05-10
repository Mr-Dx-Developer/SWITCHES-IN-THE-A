# m-Insurance script for QB-Core

| If you are intested in recieving updates join the community on **[Discord](https://discord.gg/marcinhu)**! |

# Features
- Optimized
- Many Features
- Full and easy customization
- 0.00ms
- Car Registration
- Car Insurance
- Health Insurance
- Home Insurance
- 30/60/90 Days Insurance
- Item with all information of the vehicle and expire date
- Command `checkinsurance` to check insurance on specific plate.
- Command `removeinsurance` to remove insurance on specific plate.
- Command `checkhealthinsurance` to check health insurance on specific citizenid.
- Command `removehealthinsurance` to remove health insurance on specific citizenid.
- Command `checkhomeinsurance` to check home insurance on specific citizenid.
- Command `removehomeinsurance` to remove home insurance on specific citizenid.
- All the commands can be blocked by job.
- Every hour, the SQL dates are checked and if any date is exceeded, the insurance information is removed from the SQL.
- Support for qb/ox target.
- Support for qb/ox inventory.
- Support for dp/rp emotes.
- Support for qb/ox menu.

# Exports:
- Check if car has insurance use: `exports["m-Insurance"]:haveInsurance(plate)`
- Check if player has health insurance: `exports["m-Insurance"]:haveHealthInsurance(citizenid)`
- Check if player has home insurance: `exports["m-Insurance"]:haveHomeInsurance(citizenid)`

# Required

- if the Vehicle Model appears NULL to check the vehicles.meta and that the gameName needs to be the same as the modelName

You need to SetUp `SQL.sql`. Basically click on the file and run it using HeidSQL.


## Installation ##

1. qb-core/shared/items.lua

```lua

	["insurance"]         = {["name"] = "insurance",          ["label"] = "Car Insurance",             ["weight"] = 150,         ["type"] = "item",         ["image"] = "insurance.png",                    ["unique"] = true,       ["useable"] = true,    ["shouldClose"] = false,    ["combinable"] = nil,   ["description"] = ""},
    
    ["car_registration"]            = {["name"] = "car_registration",   ["label"] = "Car Registration",         ["weight"] = 150,         ["type"] = "item",         ["image"] = "car_registration.png",                    ["unique"] = true,       ["useable"] = true,    ["shouldClose"] = false,    ["combinable"] = nil,   ["description"] = ""},
    
    ["health_insurance"]  = {["name"] = "health_insurance",   ["label"] = "Health Insurance",         ["weight"] = 150,         ["type"] = "item",        ["image"] = "health_insurance.png",               ["unique"] = true,      ["useable"] = true,    ["shouldClose"] = false,    ["combinable"] = nil,   ["description"] = ""},
    
    ["home_insurance"]    = {["name"] = "home_insurance",     ["label"] = "Home Insurance",         ["weight"] = 150,         ["type"] = "item",        ["image"] = "home_insurance.png",                    ["unique"] = true,      ["useable"] = true,    ["shouldClose"] = false,    ["combinable"] = nil,   ["description"] = ""},

```

2. dpemotes/Client/AnimationList.lua

```lua

    ["health_insurance"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Card", AnimationOptions =
    {
        Prop = "m-insurance_prop_card_health",
        PropBone = 18905,
        PropPlacement = {0.17, 0.03, 0.04, 1.0, 184.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["car_insurance"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Card", AnimationOptions =
    {
        Prop = "m-insurance_prop_card_vehicle",
        PropBone = 18905,
        PropPlacement = {0.17, 0.03, 0.04, 1.0, 184.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["car_registration"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Card", AnimationOptions =
    {
        Prop = "m-insurance_prop_card_registration",
        PropBone = 18905,
        PropPlacement = {0.17, 0.03, 0.04, 1.0, 184.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},
    ["home_insurance"] = {"anim@heists@humane_labs@finale@keycards", "ped_a_enter_loop", "Card", AnimationOptions =
    {
        Prop = "m-insurance_prop_card_house",
        PropBone = 18905,
        PropPlacement = {0.17, 0.03, 0.04, 1.0, 184.0, 0.0},
        EmoteLoop = true,
        EmoteMoving = true,
    }},

```

2. scully_emotemenu/data/animations/prop_emotes.lua

```lua
    {
        Label = 'Health Insurance',
        Command = 'health_insurance',
        Animation = 'ped_a_enter_loop',
        Dictionary = 'anim@heists@humane_labs@finale@keycards',
        Options = {
            Props = {
                {
                    Bone = 18905,
                    Name = 'm-insurance_prop_card_health',
                    Placement = {
                        vector3(0.17, 0.03, 0.04),
                        vector3(1.0, 184.0, 0.0),
                    },
                },
            },
        },
    },
    {
        Label = 'Car Insurance',
        Command = 'car_insurance',
        Animation = 'ped_a_enter_loop',
        Dictionary = 'anim@heists@humane_labs@finale@keycards',
        Options = {
            Props = {
                {
                    Bone = 18905,
                    Name = 'm-insurance_prop_card_vehicle',
                    Placement = {
                        vector3(0.17, 0.03, 0.04),
                        vector3(1.0, 184.0, 0.0),
                    },
                },
            },
        },
    },
    {
        Label = 'Car Registration',
        Command = 'car_registration',
        Animation = 'ped_a_enter_loop',
        Dictionary = 'anim@heists@humane_labs@finale@keycards',
        Options = {
            Props = {
                {
                    Bone = 18905,
                    Name = 'm-insurance_prop_card_registration',
                    Placement = {
                        vector3(0.17, 0.03, 0.04),
                        vector3(1.0, 184.0, 0.0),
                    },
                },
            },
        },
    },
    {
        Label = 'Home Registration',
        Command = 'home_insurance',
        Animation = 'ped_a_enter_loop',
        Dictionary = 'anim@heists@humane_labs@finale@keycards',
        Options = {
            Props = {
                {
                    Bone = 18905,
                    Name = 'm-insurance_prop_card_house',
                    Placement = {
                        vector3(0.17, 0.03, 0.04),
                        vector3(1.0, 184.0, 0.0),
                    },
                },
            },
        },
    },

```

3. qb-inventory|lj-inventory/html/js/app.js

```lua

    } else if (itemData.name == "insurance") {
        $(".item-info-title").html("<p>" + itemData.label + "</p>");
        $(".item-info-description").html(
            "<p><strong>Name: </strong><span>" +
            itemData.info.name +
            "</span></p><p><strong>Plate: </strong><span>" +
            itemData.info.plate +
            "</span></p><p><strong>Vehicle Model: </strong><span>" +
            itemData.info.model +
            "</span></p><p><strong>Date: </strong><span>" +
            itemData.info.date +
            "</span></p><p><strong>Expires: </strong><span>" +
            itemData.info.expire +
            "</span></p>"
        );

    } else if (itemData.name == "car_registration") {
        $(".item-info-title").html("<p>" + itemData.label + "</p>");
        $(".item-info-description").html(
            "<p><strong>Name: </strong><span>" +
            itemData.info.name +
            "</span></p><p><strong>Plate: </strong><span>" +
            itemData.info.plate +
            "</span></p><p><strong>Vehicle Model: </strong><span>" +
            itemData.info.model +
            "</span></p>"
        );

    } else if (itemData.name == "health_insurance") {
        $(".item-info-title").html("<p>" + itemData.label + "</p>");
        $(".item-info-description").html(
            "<p><strong>Name: </strong><span>" +
            itemData.info.name +
            "<p><strong>CitizenID: </strong><span>" +
            itemData.info.citizenid +
            "</span></p><p><strong>Date: </strong><span>" +
            itemData.info.date +
            "</span></p><p><strong>Expires: </strong><span>" +
            itemData.info.expire +
            "</span></p>"
        );
    } else if (itemData.name == "home_insurance") {
        $(".item-info-title").html("<p>" + itemData.label + "</p>");
        $(".item-info-description").html(
            "<p><strong>Name: </strong><span>" +
            itemData.info.name +
            "<p><strong>CitizenID: </strong><span>" +
            itemData.info.citizenid +
            "</span></p><p><strong>Date: </strong><span>" +
            itemData.info.date +
            "</span></p><p><strong>Expires: </strong><span>" +
            itemData.info.expire +
            "</span></p>"
        );

```

3. If you use new qb-inventory:

```lua

    case "insurance":
        return `<p><strong>Name: </strong><span>${itemData.info.name}</span></p>
        <p><strong>Plate: </strong><span>${itemData.info.plate}</span></p>
        <p><strong>Model: </strong><span>${itemData.info.model}</span>
        <p><strong>Date: </strong><span>${itemData.info.date}</span></p>
        </p><p><strong>Expire: </strong><span>${itemData.info.expire}</span></p>`;
    case "car_registration":
        return `<p><strong>Name: </strong><span>${itemData.info.name}</span></p>
        <p><strong>Plate: </strong><span>${itemData.info.plate}</span></p>
        </p><p><strong>Model: </strong><span>${itemData.info.model}</span></p>`;
    case "health_insurance":
        return `<p><strong>Name: </strong><span>${itemData.info.name}</span></p>
        <p><strong>Citizen ID: </strong><span>${itemData.info.citizenid}</span></p>
        <p><strong>Date: </strong><span>${itemData.info.date}</span></p>
        </p><p><strong>Expire: </strong><span>${itemData.info.expire}</span></p>`;

```


4. qb-radialmenu config.lua

```lua
{
    id = 'checkinsurance',
    title = 'Check Insurance',
    icon = 'car',
    type = 'client',
    event = 'm-Insurance:Client:CheckVehicleInsurance',
    shouldClose = true
},
```

# Compatibilities:

1. okokVehicleShop/sv_utils.lua

Search this code:

```lua
    RegisterServerEvent(Config.EventPrefix..':setVehicleOwned')
    AddEventHandler(Config.EventPrefix..':setVehicleOwned', function (vehicleProps, vehicleModel, id)
        local _source = source
        local xPlayer = QBCore.Functions.GetPlayer(_source)

        MySQLexecute('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (@license, @citizenid, @vehicle, @hash, @mods, @plate, @state)', {
            ['@license'] = xPlayer.PlayerData.license,
            ['@citizenid'] = xPlayer.PlayerData.citizenid,
            ['@vehicle'] = vehicleModel,
            ['@hash'] = GetHashKey(vehicleModel),
            ['@mods'] = json.encode(vehicleProps),
            ['@plate'] = vehicleProps.plate:match( "^%s*(.-)%s*$" ),
            ['@state'] = 0
        }, function (rowsChanged)
        end)
    end)
```

Replace with: 

```lua
    RegisterServerEvent(Config.EventPrefix..':setVehicleOwned')
    AddEventHandler(Config.EventPrefix..':setVehicleOwned', function (vehicleProps, vehicleModel, id)
        local _source = source
        local xPlayer = QBCore.Functions.GetPlayer(_source)
        local Inventory = "qb" -- "qb" or "ox"
        
        MySQLexecute('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, state) VALUES (@license, @citizenid, @vehicle, @hash, @mods, @plate, @state)', {
            ['@license'] = xPlayer.PlayerData.license,
            ['@citizenid'] = xPlayer.PlayerData.citizenid,
            ['@vehicle'] = vehicleModel,
            ['@hash'] = GetHashKey(vehicleModel),
            ['@mods'] = json.encode(vehicleProps),
            ['@plate'] = vehicleProps.plate:match( "^%s*(.-)%s*$" ),
            ['@state'] = 0
        }, function (rowsChanged)
        end)

        local info     = {}
        info.name      = xPlayer.PlayerData.charinfo.firstname .. " " .. xPlayer.PlayerData.charinfo.lastname
        info.plate     = vehicleProps.plate
        info.model     = vehicleModel

        if Inventory == "qb" then
            TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items["car_registration"], 'add')
            xPlayer.Functions.AddItem('car_registration', 1, false, info)
        elseif Inventory == "ox" then
            local metadata = { description = 'Name: '..name..'   \nPlate: '..vehicleProps.plate..'   \nModel: '..vehicleModel }
            exports.ox_inventory:AddItem(_source, 'car_registration', 1, metadata)
            TriggerClientEvent('inventory:client:ItemBox', _source, QBCore.Shared.Items["car_registration"], 'add')
        end

        MySQLexecute('INSERT INTO m_insurance_registration (plate, model, registration) VALUES (?, ?, ?)', {vehicleProps.plate, vehicleModel, 1})
    end)
```

2. qb-vehicleshop/server.lua

Search this code:

```lua
    RegisterNetEvent('qb-vehicleshop:server:buyShowroomVehicle', function(vehicle)
        local src = source
        vehicle = vehicle.buyVehicle
        local pData = QBCore.Functions.GetPlayer(src)
        local cid = pData.PlayerData.citizenid
        local cash = pData.PlayerData.money['cash']
        local bank = pData.PlayerData.money['bank']
        local vehiclePrice = QBCore.Shared.Vehicles[vehicle]['price']
        local plate = GeneratePlate()

        if cash > tonumber(vehiclePrice) then
            MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
                pData.PlayerData.license,
                cid,
                vehicle,
                GetHashKey(vehicle),
                '{}',
                plate,
                'pillboxgarage',
                0
            })
            TriggerClientEvent('QBCore:Notify', src, Lang:t('success.purchased'), 'success')
            TriggerClientEvent('qb-vehicleshop:client:buyShowroomVehicle', src, vehicle, plate)
            pData.Functions.RemoveMoney('cash', vehiclePrice, 'vehicle-bought-in-showroom')
        elseif bank > tonumber(vehiclePrice) then
            MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
                pData.PlayerData.license,
                cid,
                vehicle,
                GetHashKey(vehicle),
                '{}',
                plate,
                'pillboxgarage',
                0
            })
            TriggerClientEvent('QBCore:Notify', src, Lang:t('success.purchased'), 'success')
            TriggerClientEvent('qb-vehicleshop:client:buyShowroomVehicle', src, vehicle, plate)
            pData.Functions.RemoveMoney('bank', vehiclePrice, 'vehicle-bought-in-showroom')
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t('error.notenoughmoney'), 'error')
        end
    end)
```

Replace with:

```lua
    RegisterNetEvent('qb-vehicleshop:server:buyShowroomVehicle', function(vehicle)
        local src = source
        vehicle = vehicle.buyVehicle
        local pData = QBCore.Functions.GetPlayer(src)
        local cid = pData.PlayerData.citizenid
        local cash = pData.PlayerData.money['cash']
        local bank = pData.PlayerData.money['bank']
        local vehiclePrice = QBCore.Shared.Vehicles[vehicle]['price']
        local plate = GeneratePlate()

        if cash > tonumber(vehiclePrice) then
            MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
                pData.PlayerData.license,
                cid,
                vehicle,
                GetHashKey(vehicle),
                '{}',
                plate,
                'pillboxgarage',
                0
            })
            TriggerClientEvent('QBCore:Notify', src, Lang:t('success.purchased'), 'success')
            TriggerClientEvent('qb-vehicleshop:client:buyShowroomVehicle', src, vehicle, plate)
            pData.Functions.RemoveMoney('cash', vehiclePrice, 'vehicle-bought-in-showroom')

            local Inventory = "qb" -- "qb" or "ox"
            local info     = {}
            info.name      = pData.PlayerData.charinfo.firstname .. " " .. pData.PlayerData.charinfo.lastname
            info.plate     = plate
            info.model     = vehicle

            if Inventory == "qb" then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["car_registration"], 'add')
                pData.Functions.AddItem('car_registration', 1, false, info)
            elseif Inventory == "ox" then
                local metadata = { description = 'Name: '..name..'   \nPlate: '..plate..'   \nModel: '..vehicle }
                exports.ox_inventory:AddItem(src, 'car_registration', 1, metadata)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["car_registration"], 'add')
            end

            MySQL.insert('INSERT INTO m_insurance_registration (plate, model, registration) VALUES (?, ?, ?)', {plate, vehicle, 1})

        elseif bank > tonumber(vehiclePrice) then
            MySQL.insert('INSERT INTO player_vehicles (license, citizenid, vehicle, hash, mods, plate, garage, state) VALUES (?, ?, ?, ?, ?, ?, ?, ?)', {
                pData.PlayerData.license,
                cid,
                vehicle,
                GetHashKey(vehicle),
                '{}',
                plate,
                'pillboxgarage',
                0
            })
            TriggerClientEvent('QBCore:Notify', src, Lang:t('success.purchased'), 'success')
            TriggerClientEvent('qb-vehicleshop:client:buyShowroomVehicle', src, vehicle, plate)
            pData.Functions.RemoveMoney('bank', vehiclePrice, 'vehicle-bought-in-showroom')

            local Inventory = "qb" -- "qb" or "ox"
            local info     = {}
            info.name      = pData.PlayerData.charinfo.firstname .. " " .. pData.PlayerData.charinfo.lastname
            info.plate     = plate
            info.model     = vehicle

            if Inventory == "qb" then
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["car_registration"], 'add')
                pData.Functions.AddItem('car_registration', 1, false, info)
            elseif Inventory == "ox" then
                local metadata = { description = 'Name: '..name..'   \nPlate: '..plate..'   \nModel: '..vehicle }
                exports.ox_inventory:AddItem(src, 'car_registration', 1, metadata)
                TriggerClientEvent('inventory:client:ItemBox', src, QBCore.Shared.Items["car_registration"], 'add')
            end

            MySQL.insert('INSERT INTO m_insurance_registration (plate, model, registration) VALUES (?, ?, ?)', {plate, vehicle, 1})
        else
            TriggerClientEvent('QBCore:Notify', src, Lang:t('error.notenoughmoney'), 'error')
        end
    end)
```

3. qb-ambulancejob/server/main.lua

```lua
    RegisterNetEvent('hospital:server:SendToBed', function(bedId, isRevive)
        local src = source
        local Player = QBCore.Functions.GetPlayer(src)
        local citizenid = Player.PlayerData.citizenid 

        TriggerClientEvent('hospital:client:SendToBed', src, bedId, Config.Locations["beds"][bedId], isRevive)
        TriggerClientEvent('hospital:client:SetBed', -1, bedId, true)

    if exports['m-Insurance']:haveHealthInsurance(citizenid) then 
        Player.Functions.RemoveMoney("bank", Config.BillCost - 500, "respawned-at-hospital") -- The "500" is the discount, you can change it
        exports['qb-management']:AddMoney("ambulance", Config.BillCost - 500) -- The "500" is the discount, you can change it
    else
        Player.Functions.RemoveMoney("bank", Config.BillCost , "respawned-at-hospital")
        exports['qb-management']:AddMoney("ambulance", Config.BillCost)
    end
        TriggerClientEvent('hospital:client:SendBillEmail', src, Config.BillCost)
    end)
```