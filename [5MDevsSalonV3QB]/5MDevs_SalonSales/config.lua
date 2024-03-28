Config = {}

Config.SalesArea = {
    [1] = {
            coords = vector3(412.34, 314.81, 103.13),
            length = 1.5,
            width = 1.8,
            heading = 207.0,
            debugPoly = false,
            minZ = 100.97,
            maxZ = 105.42,
            distance = 3.0
        },
    [2] = {
            coords = vector3(-368.6359, -240.1280, 36.0801),
            length = 1.5,
            width = 1.8,
            heading = 227.7473,
            debugPoly = false,
            minZ = 30.97,
            maxZ = 105.42,
            distance = 3.0
        },
    }

Config.BankMoney = false 
Config.UseTimes = false -- Set to false if you want sales available 24/7
Config.TimeOpen = 7 -- Opening Time military time
Config.TimeClosed = 17 -- Closing Time

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'

Config.Bundles = {
    [1] = {
        item = 'fmdblonde_bundlesbox',
        price = math.random(50,100)
    },
    [2] = {
        item = 'fmdred_bodywavebox',
        price = math.random(50,100)
    },
    [3] = {
        item = 'fmdbbrown_bundlesbox',
        price = math.random(50,100)
    },
    [4] = {
        item = 'fmdccpink_bundlesbox',
        price = math.random(50,100)
    },
    [5] = {
        item = 'fmdauburn_bundlesbox',
        price = math.random(50,100)
    },
    [6] = {
        item = 'fmdblack_bundlesbox',
        price = math.random(50,100)
    },
    [7] = {
        item = 'fmdbrown_bundlesbox',
        price = math.random(50,100)
    },
    [8] = {
        item = 'fmdplatinum_bundlesbox',
        price = math.random(50,100)
    },
    [9] = {
        item = 'fmdccblue_bundlesbox',
        price = math.random(50,100)
    },
    [10] = {
        item = 'fmdlime_bundlesbox',
        price = math.random(50,100)
    },
    [11] = {
        item = 'fmdpurple_bundlesbox',
        price = math.random(50,100)
    },
    [12] = {
        item = 'fmdmidb_bundlesbox',
        price = math.random(50,100)
    },
    [13] = {
        item = 'fmdkblack_bundlesbox',
        price = math.random(50,100)
    },
    [14] = {
        item = 'fmdkblonde_bundlesbox',
        price = math.random(50,100)
    },
    [15] = {
        item = 'fmdkblue_bundlesbox',
        price = math.random(50,100)
    },
}

