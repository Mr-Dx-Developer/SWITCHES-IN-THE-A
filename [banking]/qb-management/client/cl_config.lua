-- Zones for Menues
Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.BossMenus = {
    ['police'] = {
        vector3(461.45, -986.2, 30.73),
    },
    ['ambulance'] = {
        vector3(335.46, -594.52, 43.28),
    },
    ['realestate'] = {
        vector3(-716.11, 261.21, 84.14),
    },
    ['taxi'] = {
        vector3(907.24, -150.19, 74.17),
    },
    ['cardealer'] = {
        vector3(-27.47, -1107.13, 27.27),
    },
    ['mechanic'] = {
        vector3(-339.53, -156.44, 44.59),
    },
    ['cookies'] = {
        vector3(-934.1, -1168.34, 5.11), --place this in qb-management/client/cl_config.lua [Config.BossMenus]
    },
    ['cannabiscafe'] = {
        vector3(183.1, -251.59, 53.07), --place this in qb-management/client/cl_config.lua
    },
    ['vroyluxury'] = {
        vector3(961.86, -950.19, 50.34), --place this in qb-management/client/cl_config.lua
    },
    ['mcdonalds'] = {
        vector3(-222.51, -1318.98, 31.45),
    },
    
    
}

Config.BossMenuZones = {
    ['police'] = {
        { coords = vector3(447.23, -974.3, 31.47), length = 1.35, width = 1.45, heading = 351.0, minZ = 30.00, maxZ = 31.73 },    },
    ['ambulance'] = {
        { coords = vector3(335.46, -594.52, 43.28), length = 1.2, width = 0.6, heading = 341.0, minZ = 43.13, maxZ = 43.73 },
    },
    ['realestate'] = {
        { coords = vector3(-716.11, 261.21, 84.14), length = 0.6, width = 1.0, heading = 25.0, minZ = 83.943, maxZ = 84.74 },
    },
    ['taxi'] = {
        { coords = vector3(907.24, -150.19, 74.17), length = 1.0, width = 3.4, heading = 327.0, minZ = 73.17, maxZ = 74.57 },
    },
    ['cardealer'] = {
        { coords = vector3(-27.47, -1107.13, 27.27), length = 2.4, width = 1.05, heading = 340.0, minZ = 27.07, maxZ = 27.67 },
    },
    ['mechanic'] = {
        { coords = vector3(-339.53, -156.44, 44.59), length = 1.15, width = 2.6, heading = 353.0, minZ = 43.59, maxZ = 44.99 },
    },
    ['cookies'] = {
        {coords = vector3(-934.1, -1168.34, 5.11), length = 1.15, width = 2.6, heading = 353.0, minZ = 4.11, maxZ = 5.99}, --place this in qb-management/client/cl_config.lua [Config.BossMenuZones]
    },
    ['cannabiscafe'] = {
        {coords = vector3(183.1, -251.59, 53.07), length = 1.15, width = 2.6, heading = 353.0, minZ = 52.5, maxZ = 53.99}, --place this in qb-management/client/cl_config.lua [Config.BossMenuZones]
    },
    ['vroyluxury'] = {
        {coords = vector3(961.86, -950.19, 50.34), length = 1.15, width = 2.6, heading = 0.0, minZ = 49.34, maxZ = 53.34}, --place this in qb-management/client/cl_config.lua [Config.BossMenuZones]
    },
    ['mcdonalds'] = {
        { coords = vector3(-222.51, -1318.98, 31.45), length = 1.15, width = 2.6, heading = 0.0, minZ = 30.45, maxZ = 34.45 },
    },
}

Config.GangMenus = {
    ['lostmc'] = {
        vector3(0, 0, 0),
    },
    ['ballas'] = {
        vector3(0, 0, 0),
    },
    ['vagos'] = {
        vector3(0, 0, 0),
    },
    ['cartel'] = {
        vector3(0, 0, 0),
    },
    ['families'] = {
        vector3(0, 0, 0),
    },
}

Config.GangMenuZones = {
    --[[
    ['gangname'] = {
        { coords = vector3(0.0, 0.0, 0.0), length = 0.0, width = 0.0, heading = 0.0, minZ = 0.0, maxZ = 0.0 },
    },
    ]]
}
