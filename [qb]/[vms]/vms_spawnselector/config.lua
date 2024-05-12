Config = {}

-- Client Trigger: "vms_spawnselector:open"
-- Client Export: exports['vms_spawnselector']:OpenSpawnSelector


Config.Core = "QB-Core" -- "ESX" / "QB-Core"
Config.CoreExport = function()
    --return exports['es_extended']:getSharedObject() -- ESX
    return exports['qb-core']:GetCoreObject() -- QB-CORE
end

Config.Notification = function(message, time, type)
    if type == "error" then
       -- exports['vms_notify']:Notification('SPAWN SELECTOR', message, time, '#f52a2a', 'fa-solid fa-map-pin')
        -- ESX.ShowNotification(message)
        QBCore.Functions.Notify(message, 'error', time)
    end
end

Config.Translate = {
    ['cannot_spawn_on_dead'] = "Your previous game ended in death, you must be reborn in the last location."
}

Config.Hud = {
    Enable = function()
        -- exports['hud']:DisplayHud(true)
    end,
    Disable = function()
        -- exports['hud']:DisplayHud(false)
    end
}

Config.WeatherSync = "qb-weathersync" -- "cd_easytime", "qb-weathersync", "vSync"
Config.Weather = 'CLEAR' -- weather type
Config.Time = {hour = 20, minutes = 0}

Config.OnDeadOnlyLastPosition = true -- When the player is dead, should he be able to be reborn only in the previous location or can he be reborn in any location

Config.Spawns = {
    [1] = {
        camCoords = vector3(1151.57, -627.64, 65.27),
        spawnCoords = vector4(1127.14, -645.29, 55.79, 281.89),
        label = "Mirror Park",
        address = "Mirror Park Blvd",
    },
    [2] = {
        camCoords = vector3(-1011.8, -2714.38, 23.61),
        spawnCoords = vector4(-1037.8, -2737.82, 19.17, 325.98),
        label = "Airport",
        address = "New Empire Way",
    },
    [3] = {
        camCoords = vector3(-1249.22, -1469.2, 10.6),
        spawnCoords = vector4(-1265.34, -1481.28, 3.33, 286.73),
        label = "Beach",
        address = "Aguja St.",
    },
    [4] = {
        camCoords = vector3(1113.8, 2680.31, 46.42),
        spawnCoords = vector4(1138.84, 2672.44, 37.13, 89.32),
        label = "Sandy Shores",
        address = "Route 68",
    },
    [5] = {
        camCoords = vector3(176.68, 6555.92, 43.24),
        spawnCoords = vector4(159.59, 6587.62, 31.12, 187.2),
        label = "Paleto Bay",
        address = "Great Ocean Hwy",
    },
}