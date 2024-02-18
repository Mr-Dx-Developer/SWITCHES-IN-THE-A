Config = {}

Config.Framework = "qb"                                                                                                                       -- Place here the framework either esx or qb
Config.Language = 'en'                                                                                                                        -- Set the language in which you want to have the script [en, en].
Config.Debug = false                                                                                                         -- Enable debug mode by setting this to true (Multiple console prints showing debug information and enabling color shapes for zones). -- true make the script very slow
Config.AllowImages = true                                                                                                   -- this option can delay the alert
Config.DiscordWebHook = '' -- Discord webhook to upload new images
Config.vehiclesTable = "player_vehicles"
Config.useLogo = true                                                                                                       -- Use logo in the Dispatch
Config.plateImage = 'https://www.quasar-store.com/static/5012-AT_6_x_12.png'
Config.logoURL = 'https://www.quasar-store.com/static/media/logo192.png'                                                                     -- or false if you dont want use logo
Config.useVehicleIconsInDispatchLargueMap = false                                                                           -- if you set it to true the Dispatch icons for the people will be the vehicle icons instead of the player icons (Common blip map)



Config.InventorySystem = "qb-inventory" -- qb-inventory or qs-inventory or esx-default you can select ox-inventory but this is not fully tested

--[[
    Billing configuration, choose between the options that we bring by default
    or configure more in client/custom/billing/*.lua.

    By default choose:
        'qs-billing' Buy Now in https://www.quasar-store.com
        'esx_billing' - https://github.com/esx-framework/esx_billing
        'okokBilling' - https://okok.tebex.io/package/5246431
        'jim-payments' - https://github.com/jimathy/jim-payments (Not fully compatible, prefer use other billing systems or disable billing in this script (Config.showBillsInMDT = false))
        'jaksam-billing-ui' - JAKSAM IN TEBEX
]]

Config.Billing = 'okokBilling'
Config.showBillsInMDT = true -- configure your billing system in server/custom/misc/players.lua (Edit getBills function) prefer turn false if you using jim-payments

--[[
    vehicles configuration, choose between the options that we bring by default
    or configure more in server/custom/vehicles/*.lua.

    By default choose:
        'esx_garages'
        'qb_garages'
        'qs-garages'
]]

Config.VehicleGarages = 'jg-advancedgarages'

Config.Keys = {
    --Basic keys
    ["OpenLargue"] = "L",
    ["OpenSmall"] = "K",
    ["MoveSmall"] = "U"
}

Config.MoveRight = 'RIGHT' --Key to scroll right through the notifications on the small UI. (RIGHT ARROW default)
Config.MoveLeft = 'LEFT'   --Key to scroll left through the notifications on the small UI. (LEFT ARROW default)
Config.Respond = 'G'       --Key to respond/unrespond on the small UI. (G default).


Config.Radar = {
    enabled = true,
    needVehicleInWhitelist = false, -- need vehicle in whitelist to use radar
    jobsAllowedToUseRadar = {       -- Jobs allowed to use the radar
        "police"
    },
    vehiclesWhitelist = {
        'police3', -- Vehicle name
        'police',
    }
}


Config.DefaultSpeedLimit = 100 -- radar freeze if the vehicle > this velocity
Config.TimeToFreeze = 2000

Config.JobsAllowed = { -- Jobs allowed to use the Dispatch
    "police",
    "mechanic",
    "ambulance"
}

Config.PlayerLocationTick = 5 -- The time in seconds it takes to update the player's location (preferable not to touch).

--[[
    WARNING: IF YOU REDUCE THE TIME OF THE PLAYER LOCATION TICK, THE DISPATCH WILL BE MORE SLOW AND WILL BE GENERATE CRASHES TO YOUR PLAYERS
    EVERY RECOMENDED USE THE PATREON FIVEM AND ACTIVATE THE ONESYNC INFINITY
]]

Config.ShowOwnBlip = false        -- Show your own blip on the map
Config.JobsBlips = {              -- Blips for players depending on their job
    ['police'] = {                --JOB
        show = true,              -- Enable or disable
        color = 38,               -- Color
        sprite = {
            ['walking'] = 1,      -- Sprite
            ['automobile'] = 225, -- sprite
            ['bike'] = 559,       -- sprite
            ['boat'] = 404,       -- sprite
            ['heli'] = 422,       -- sprite
            ['plane'] = 307,      -- sprite
        },
        showJobs = {
            'ambulance' -- need Exist Blip config in this section
        },
        scale = 1.0,    -- Scale
        showConeOfView = true,
    },
    ['ambulance'] = {             --JOB
        show = true,              -- Enable or disable
        color = 66,               -- Color
        sprite = {
            ['walking'] = 1,      -- Sprite
            ['automobile'] = 225, -- sprite
            ['bike'] = 559,       -- sprite
            ['boat'] = 404,       -- sprite
            ['heli'] = 422,       -- sprite
            ['plane'] = 307,      -- sprite
        },
        showJobs = {
            'police' -- need Exist Blip config in this section
        },
        scale = 1.0, -- Scale
        showConeOfView = false,
    },
    ['mechanic'] = {              --JOB
        show = true,              -- Enable or disable
        color = 43,               -- Color
        sprite = {
            ['walking'] = 1,      -- Sprite
            ['automobile'] = 225, -- sprite
            ['bike'] = 559,       -- sprite
            ['boat'] = 404,       -- sprite
            ['heli'] = 422,       -- sprite
            ['plane'] = 307,      -- sprite
        },
        showJobs = {
            -- 'police' -- cant view other job blips
        },
        scale = 1.0, -- Scale
        showConeOfView = false,
    },
}

Config.Commands = {
    ["OpenLargue"] = "dispatch",                 -- prefer dont touch this
    ["OpenSmall"] = "smalldispatch",             -- prefer dont touch this
    ["MoveSmall"] = "movedispatchcomps",         -- Command to move small dispatch
    ["DisableSpeedRadar"] = 'disablespeedradar', -- Command to disable speed radar
    ["OpenMdt"] = 'openmdt'                      -- Command to open MDT
}

Config.JobsAllowedToMDT = { -- Jobs allowed to use police MDT
    "police",
    "mechanic",
    "ambulance"
}

Config.NeedItemForMDT = false -- Use item for open MDT
Config.MDTItemName = 'mdt'    -- Item name for open MDT


Config.Penitencial = {
    keyForSendToJail = 'E',
    JobsAllowedToSendToJail = {
        "police",
        -- "fbi"
    },
    TimeToRemoveCodes = {
        [1] = 1,  -- remove is out of camera view past 3 minutes
        [2] = 5,  -- remove is out of camera view past 5 minutes
        [3] = 10, -- remove is out of camera view past 10 minutes
        [4] = 15, -- remove is out of camera view past 15 minutes
        [5] = 20, -- remove is out of camera view past 20 minutes
        [6] = 25, -- remove is out of camera view past 25 minutes
    },
    IlegalItems = {
        'weapon_pistol',
        'pistol_ammo'
    },
    jai = true,
    AbleToSelectWhetherToPardonJail = true,
    CanSendToJailIfNotInPoint = false,
    SendToJailPoints = {
        {
            title = 'Mission Row PD',
            coords = vector3(460.0216, -1001.5779, 24.9149),
        },
        {
            title = 'Mission Row PD',
            coords = vector3(459.1117, -997.9485, 24.9149),
        },
        {
            title = 'Mission Row PD',
            coords = vector3(460.0694, -994.2761, 24.9149),
        }
    },
    Jail = {
        name = 'Jail of paleto',
        coords = vector3(1691.7264, 2582.1084, 45.5648),
        radius = 150,
        spawnPoints = { -- sure this points is inside the zone
            vector4(1678.5844, 2541.4470, 45.5645, 267.97),
            vector4(1678.5844, 2541.4470, 45.5645, 267.97),
            vector4(1678.5844, 2541.4470, 45.5645, 267.97)
        },
        exitPoints = {
            vector4(1850.7671, 2586.0156, 45.6720, 274.4039)
        },
        ReturnToJailIfScaped = false, -- if this is true the player will return to jail if he escapes or if false the player will be free but the officers receive a notification seted after
        onEscaped = function(playerId)
            exports['qs-dispatch']:GetPlayerInfo(playerId, function(playerData)
                if (not playerData) then
                    ErrorPrint("Error getting player data")
                    return
                end
                exports['qs-dispatch']:GetSSURL(playerId, function(screenshot)
                    TriggerEvent('qs-dispatch:server:CreateDispatchCall', {
                        job = { 'police', 'sheriff', 'traffic', 'patrol' },
                        callLocation = playerData.coords,
                        callCode = { code = 'Escaped prisoner', snippet = 'Prision' },
                        message = "A" .. playerData.sex .. " prisoner has escaped from the " .. Config.Penitencial.Jail.name .. " prison",
                        flashes = true,
                        image = screenshot or nil,
                        blip = {
                            sprite = 137,
                            scale = 1.5,
                            colour = 1,
                            flashes = true,
                            text = 'Escaped Prisoner',
                            time = (20 * 1000), --20 secs
                        }
                    })
                end)
            end)
        end
    },
}

Config.VelocityRadar = { -- Velocity Radar Config
    enabled = true,      -- Enable velocity Radars in the map
    activateFXFlash = true,
    account = "money",   -- Exceeding the limit will remove the money from this account.
    amount = 1200,
    useMph = false,
    onDispatchCall = function() -- This function is called when the radar sends the dispatch signal. (you can remove it if you prefer)
        local playerData = exports['qs-dispatch']:GetPlayerInfo()
        DebugPrint('onDispatchCall', playerData)
        exports['qs-dispatch']:getSSURL(function(image)
            DebugPrint('image', image)
            TriggerServerEvent('qs-dispatch:server:CreateDispatchCall', {
                job = { 'police', 'sheriff', 'traffic', 'patrol' },
                callLocation = playerData.coords,
                callCode = { code = 'Hight Speed', snippet = 'Vehicle' },
                message = 'A vehicle model ' ..
                    playerData.vehicle_label ..
                    ' with license plate ' ..
                    playerData.vehicle_plate ..
                    ' of color ' .. playerData.vehicle_colour .. ' is traveling at ' .. playerData.speed .. ' km/h',
                flashes = false,
                image = image or nil,
                blip = {
                    sprite = 488,
                    scale = 1.5,
                    colour = 1,
                    flashes = true,
                    text = 'Hight Speed',
                    time = (20 * 1000), --20 secs
                }
            })
        end)
    end,
    onHistoryToMDT = function(zone, kmh, amount)
        --[[
            Hi dear customer, this fragment use our MDT integrated system, you can place here your Trigger server event or client export to add content to your MDT
        ]]
        exports['qs-dispatch']:getSSURL(function(image)
            local playerData = exports["qs-dispatch"]:GetPlayerInfo()

            TriggerServerCallback("qs-dispatch:server:setVehicleDataRecord", function(resp)
                if resp then
                    DebugPrint("BOLO SUCCESS")
                else
                    DebugPrint("BOLO ERROR")
                end
            end, {
                type = "infraction",
                plate = playerData.vehicle_plate,
                zone = zone.label,
                data = {
                    message = string.format(Lang("SPEED_LIMIT_MESSAGE"), zone.label or "Not concluse",
                        zone.velocity or " --- ", math.floor(math.abs(kmh or 0)), amount),
                    job = 'police',
                    data = {
                        { key = "Model", value = playerData.vehicle_label },
                        { key = "Plate", value = playerData.vehicle_plate },
                        { key = "Color", value = playerData.vehicle_colour },
                        { key = "Speed", value = math.floor(math.abs(kmh or 0)) .. " km/h" },
                        { key = "Zone",  value = zone.label or "Not concluse" },
                        { key = "Limit", value = getFirstLimit(zone.velocityRanges) or kmh },
                        { key = "Fine",  value = amount .. "$" },
                        { key = "Image", value = image or 'No image available' }
                    }
                }
            })
        end)
    end,
    ignoredjobs = { -- Jobs that the radar will ignore
        -- "police",
        -- "ambulance"
    },
    zones = {                 -- Zones
        [1] = {
            label = "Zone 1", -- Zone Label
            velocityRanges = {
                { limitFrom = 105, price = 8500 },
                { limitFrom = 200, price = 11000 }          -- The last one is left in nil to make it clear that this is to infinity, that is, for example, from 80 (km/h | Mph) onwards. IF limitTo is left at nil the following will not be counted (no other value can be nil ONLY limitTo can be)
            },
            coords = vector3(365.8156, 134.4366, 103.0974), -- Radar coordinates
            width = 30,                                     -- Radar width (radius)
            beforeEnterInZoneAlert = true,                  -- Alerting before entering the zone?
            beforeEnterInZoneAlertMargin = 40,              -- Margin before the warning zone
            autoBill = true,                                -- Collect fine?
            notifyInfractor = true,                         -- false = no notify fot the infractor
            sendAlertToPolice = true,                       -- Send dispatch signal to police?
            sendHistoryToMDT = true,                        -- send to MDT data record if vehicle exist
            blip = {                                        -- Blip?
                enabled = true,                             -- Blip?
                color = 3,                                  -- Blip color
                sprite = 184,                               -- Blip sprite
                scale = 0.8,                                -- Blip scale
                text = "Velocity Radar"                     -- Blip title
            }
        },
        [2] = {
            label = "Zone 2",
            velocityRanges = {
                { limitFrom = 105, price = 8500 },
                { limitFrom = 200, price = 11000 }
            },
            coords = vector3(222, 320, 0),
            width = 30,
            beforeEnterInZoneAlert = true,
            beforeEnterInZoneAlertMargin = 40,
            autoBill = true,
            notifyInfractor = true, -- false = no notify fot the infractor
            sendAlertToPolice = true,
            sendHistoryToMDT = true,
            blip = {
                enabled = true,
                color = 3,
                sprite = 184,
                scale = 0.8,
                text = "Velocity Radar"
            }
        },
        [3] = {
            label = "Zone 3",
            velocityRanges = {
                { limitFrom = 105, price = 8500 },
                { limitFrom = 200, price = 11000 }
            },
            coords = vector3(1706.6511, 1497.8977, 84.1166),
            width = 40,
            beforeEnterInZoneAlert = true,
            beforeEnterInZoneAlertMargin = 80,
            autoBill = true,
            notifyInfractor = true, -- false = no notify fot the infractor
            sendAlertToPolice = true,
            sendHistoryToMDT = true,
            blip = {
                enabled = true,
                color = 3,
                sprite = 184,
                scale = 0.8,
                text = "Velocity Radar"
            }
        }
    }
}

Config.ShootingZone = {
    enabled              = true,  -- Enable detection of shoots in zone
    useAllCameraProps    = true,  -- true = use all camera props in the map | false = detect in all place of the city (the zones in config its a whitelist zones (dont alert))
    notificationCooldown = 20000, -- Cooldown to send the call back
    CAMDistance          = 15,    -- Distance at which the cameras can detect the gunshots
    ignoredjobs          = {      -- Ignored jobs
        -- "police",
        -- "ambulance"
    },
    activateFXFlash      = false,
    onDispatchCall       = function() -- Function to be executed when gunshots are detected
        local playerData = exports['qs-dispatch']:GetPlayerInfo()
        SendTextMessage("You are shooting near the camera", 'error')
        exports['qs-dispatch']:getSSURL(function(image)
            TriggerServerEvent('qs-dispatch:server:CreateDispatchCall', {
                job = { 'police', 'swat', 'sheriff' },
                callLocation = playerData.coords,
                callCode = { code = 'Shootings in Zone', snippet = 'Fireeeeee' },
                message = 'A ' .. playerData.sex .. ' its shooting in the area',
                flashes = true,
                image = image or nil,
                blip = {
                    sprite = 110,
                    scale = 1.5,
                    colour = 1,
                    flashes = true,
                    text = 'Shootings in Zone',
                    time = (6 * 60 * 1000), -- 6 minutes
                }
            })
        end)
    end,

    zones                = {                                -- Configured zones (in this zones the shootings istn detected (whitelisted zones))
        [1] = {
            label = "Zone 1",                               -- Zone title
            coords = vector3(365.8156, 134.4366, 103.0974), -- Zone coordinates
            width = 30,                                     -- Zone radius
            sendAlertToPolice = true                        -- Enabled?
        },
        [2] = {
            label = "Zone 2",
            coords = vector3(1706.6511, 1497.8977, 84.1166),
            width = 40,
            sendAlertToPolice = true
        }
    },
    WhitelistedWeapons   = {
        "weapon_stungun"
    }
}


Config.DispatchBodyCamZones = {
    enabled = true,
    jobsAllowed = {
        "police",
        "ambulance"
    }, -- Jobs allowed to use bodycam
    zones = {
        [1] = {
            label = "Zone 1",
            coords = vector3(456.6222, -985.9254, 30.6832),
            width = 30,
        },
        [2] = {
            label = 'Test zone',
            coords = vector3(339.9770, -1397.2855, 32.5092),
            width = 30
        }
    }
}

Config.CameraModels = { -- this models will be used in the shoting zones and the convict detection on the map... -- if you need more detects you can use all type of props showed in this web https://gta-objects.xyz/objects
    GetHashKey('prop_cctv_cam_01a'),
    GetHashKey('prop_cctv_cam_01b'),
    GetHashKey('prop_cctv_cam_02a'),
    GetHashKey('prop_cctv_cam_03a'),
    GetHashKey('prop_cctv_cam_04a'),
    GetHashKey('prop_cctv_cam_04b'),
    GetHashKey('prop_cctv_cam_04c'),
    GetHashKey('prop_cctv_cam_05a'),
    GetHashKey('prop_cctv_cam_06a'),
    GetHashKey('prop_cctv_cam_07a'),
    GetHashKey('prop_snow_cam_03a'),
    GetHashKey('prop_snow_cam_03'),
    GetHashKey('police3'),
    GetHashKey('polmav'),
}
