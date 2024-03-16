Config = {}

Config.SalesArea = {
    [1] = {
            coords = vector3(-722.0934, -99.4364, 38.2439),
            length = 1.5,
            width = 1.8,
            heading = 207.0,
            debugPoly = false,
            minZ = 35.97,
            maxZ = 40.42,
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
        [3] = {
            coords = vector3(83.1096, -1387.0647, 29.4193),
            length = 1.5,
            width = 1.8,
            heading = 227.7473,
            debugPoly = false,
            minZ = 25.97,
            maxZ = 32.42,
            distance = 3.0
        },
    }

Config.BankMoney = false 
Config.UseTimes = false -- Set to false if you want sales available 24/7
Config.TimeOpen = 7 -- Opening Time military time
Config.TimeClosed = 17 -- Closing Time

Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'

Config.Purses = {
    [1] = {
        item = 'fmdbaltotebox',
        price = math.random(350,900)
    },
    [2] = {
        item = 'fmdbalwwalletbox',
        price = math.random(350,900)
    },
    [3] = {
        item = 'fmdbalpsbagbox',
        price = math.random(350,900)
    },
    [4] = {
        item = 'fmdbalpbagbox',
        price = math.random(350,900)
    },
    [5] = {
        item = 'fmdchpbox',
        price = math.random(350,900)
    },
    [6] = {
        item = 'fmdchwbox',
        price = math.random(350,900)
    },
    [7] = {
        item = 'fmdchbbox',
        price = math.random(350,900)
    },
    [8] = {
        item = 'fmdbirpsbox',
        price = math.random(350,900)
    },
    [9] = {
        item = 'fmdbirbbox',
        price = math.random(350,900)
    },
    [10] = {
        item = 'fmdbirapbox',
        price = math.random(350,900)
    },
    [11] = {
        item = 'fmdbirpinkbox',
        price = math.random(350,900)
    },
    [12] = {
        item = 'fmdlvcbbox',
        price = math.random(350,900)
    },
    [13] = {
        item = 'fmdlvtotebox',
        price = math.random(350,900)
    },
    [14] = {
        item = 'fmdlvwalletbox',
        price = math.random(350,900)
    },
    [15] = {
        item = 'fmdlvjunglebox',
        price = math.random(350,900)
    },
    [16] = {
        item = 'fmddiorapbox',
        price = math.random(350,900)
    },
    [17] = {
        item = 'fmddiorbbox',
        price = math.random(350,900)
    },
    [18] = {
        item = 'fmddiorplbox',
        price = math.random(350,900)
    },
    [19] = {
        item = 'fmddiortotebox',
        price = math.random(350,900)
    },
    [20] = {
        item = 'fmddiorptotebox',
        price = math.random(350,900)
    },
}

