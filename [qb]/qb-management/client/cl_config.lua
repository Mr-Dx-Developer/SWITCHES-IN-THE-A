-- Zones for Menues
Config = Config or {}

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true' -- Use qb-target interactions (don't change this, go to your server.cfg and add `setr UseTarget true` to use this and just that from true to false or the other way around)

Config.BossMenus = {
    ['police'] = {
        vector3(431.19, -983.16, 37.26),
    },
    ['ambulance'] = {
        vector3(310.93, -569.16, 43.27),
    },
    ['realestate'] = {
        vector3(-716.11, 261.21, 84.14),
    },
    ['taxi'] = {
        vector3(907.24, -150.19, 74.17),
    },
    ['cardealer'] = {
        vector3(-26.9847, -1108.3546, 27.2743),
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

    ['tow'] = {
        vector3(662.8, 233.42, 94.25),
    },

    ['bluenight'] = {
        vector3(-566.2417602539062, 194.6769256591797, 73.999267578125),
    },

    ['bahama'] = {
        vector3(-1379.3670654296875, -597.7186889648438, 30.20654296875),
    },
    ['whitewidow'] = {
        vector3(176.3076934814453, -257.1824035644531, 54.13330078125),
    },
    
    ['famgooncustoms'] = {
        vector3(-574.71, -937.34, 23.88),
    },

    ['popeyes'] = {
        vector3(1297.6614990234375, -753.89013671875, 65.79345703125),
    },
    ['hookahlounge'] = { --place this in qb-bossmenu/config.lua
	    vector3(-443.88, -37.63, 40.92), 
    },
    
    
}

Config.BossMenuZones = {
    ['police'] = {
        { coords = vector3(431.19, -983.16, 37.26), length = 1.35, width = 1.45, heading = 0.0, minZ = 36.26, maxZ = 40.26 },    
    },
    ['ambulance'] = {
        { coords = vector3(310.93, -569.16, 43.27), length = 1.2, width = 0.6, heading = 0.0, minZ = 42.27, maxZ = 46.27 },
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

    ['tow'] = {
        { coords = vector3(662.8, 233.42, 94.25), length = 1.15, width = 2.6, heading = 330.0, minZ = 93.01, maxZ = 95.01 },
    },

    ['bluenight'] = {
        { coords = vector3(-566.2417602539062, 194.6769256591797, 73.999267578125), length = 1.15, width = 2.6, heading = 334.4881896972656, minZ = 73.02, maxZ = 75.02 },
    },

    ['bahama'] = {
        { coords = vector3(-1379.3670654296875, -597.7186889648438, 30.20654296875), length = 1.15, width = 2.6, heading = 99.21259307861328, minZ = 29.02, maxZ = 31.02 },
    },
    ['whitewidow'] = {
        { coords = vector3(176.3076934814453, -257.1824035644531, 54.13330078125), length = 1.15, width = 2.6, heading = 150.23622131347656, minZ = 53.02, maxZ = 55.02 },
    },
    ['famgooncustoms'] = {
        { coords = vector3(-574.71, -937.34, 23.88), length = 1.15, width = 2.6, heading = 0.0, minZ = 23.02, maxZ = 24.02 },
    },

    ['popeyes'] = {
        { coords = vector3(1297.6614990234375, -753.89013671875, 65.79345703125), length = 1.15, width = 2.6, heading = 0.0, minZ = 327.02, maxZ = 329.02 },
    },
    ['hookahlounge'] = {
        { coords = vector3(-444.1450500488281,-37.635162353515625,40.889404296875), length = 1.15, width = 2.6, heading = 354.3307189941406, minZ = 39.02, maxZ = 41.02 },
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
