Config = {}

Config.debug = false

-- Precise wheel rendering (This can fix the issue with broken wheels flashing in and out) If it doesn't happen on your server
-- I wouldn't recommend enabling this as it will slightly increase the script resource usage (resmon)
Config.increaseWheelRenderTiming = false


-- Alternative method of the wheel breaking. This will make the actual model of the wheel fall off (same rim, tire etc.)
-- Although it does look better it isn't properly synced (not possible at this moment)
-- That's why it's disabled by default. Enable it if you don't care about the loose wheel prop not being synced and want it
-- to look better for the driver
Config.alternativeWheelBreak = false

-- The amount of damage the wheels will take on collisions (10-30 seems reasonable to me, for more realistic experience I'd recommend values between 50-100)
Config.collisionDamageAmount = 100

-- If you define a model specific multiplier it will be used instead of the class multiplier
-- Vehicle classes https://docs.fivem.net/natives/?_0x29439776AAA00A62
Config.collisionDamageMultiplier = {
    models = {
      kuruma2 = 0.5
    },
    classes = {
        [0] = 1.2, -- Compacts
        [1] = 1, -- Sedans
        [2] = 0.8, -- SUVs
        [3] = 1, -- Coupes
        [4] = 1, -- Muscle
        [5] = 1.25, -- Sports Classics
        [6] = 1.2, -- Sports
        [7] = 1.2, -- Super
        [8] = 1.1, -- Motorcycles
        [9] = 0.5, -- Off-road
        [10] = 0.5, -- Industrial
        [11] = 0.5, -- Utility
        [12] = 1, -- Vans
        [13] = 0.5, -- Cycles
        [14] = 0, -- Boats
        [15] = 0, -- Helicopters
        [16] = 0, -- Planes
        [17] = 0.9, -- Service
        [18] = 0.7, -- Emergency
        [19] = 0.5, -- Military
        [20] = 0.5, -- Commercial
        [21] = 0, -- Trains
    }
}


-- The amount of damage the wheels will take on falls (10-30 seems reasonable to me, for more realistic experience I'd recommend values between 50-100)
Config.fallDamageAmount = 100

-- Multiplier for the fall damage for vehicles that are using off-road tires/wheels
Config.offroadTireFallDamageMultiplier = 0.7

-- Threshold of the fall speed required to deal wheel damage (3.8 by default. If you don't want smaller jumps to deal damage set it higher)
Config.fallThreshold = 3.8

-- Minimum fall airtime (in seconds) for the wheels to get damaged. This only counts for the duration the car was falling (going downwards)
Config.minimumAirTime = 0.5

-- If you define a model specific multiplier it will be used instead of the class multiplier
-- Vehicle classes https://docs.fivem.net/natives/?_0x29439776AAA00A62
Config.fallDamageMultiplier = {
    models = {
      bf400 = 0.4,
      sanchez = 0.4,
      sanchez2 = 0.4,
      manchez = 0.4,
    },
    classes = {
        [0] = 1, -- Compacts
        [1] = 1, -- Sedans
        [2] = 0.3, -- SUVs
        [3] = 1, -- Coupes
        [4] = 0.7, -- Muscle
        [5] = 1.3, -- Sports Classics
        [6] = 1.2, -- Sports
        [7] = 1.5, -- Super
        [8] = 0.6, -- Motorcycles
        [9] = 0.3, -- Off-road
        [10] = 0.7, -- Industrial
        [11] = 0.7, -- Utility
        [12] = 1.3, -- Vans
        [13] = 0.6, -- Cycles
        [14] = 0, -- Boats
        [15] = 0, -- Helicopters
        [16] = 0, -- Planes
        [17] = 0.9, -- Service
        [18] = 0.5, -- Emergency
        [19] = 0.2, -- Military
        [20] = 0.7, -- Commercial
        [21] = 0, -- Trains
    }
}

-- Chance of the wheel falling off when it reaches critical damage (0 - 100)
Config.fallOffChance = 100

-- Chance of the tire bursting when it reaches critical damage (0 - 100)
Config.tireBurstChance = 100

-- Whether or not to respect bulletproof tires for popping (wheels will still fall off)
Config.respectBulletproofTires = false


-- Makes the car undriveable when at least one wheel falls off
Config.setVehicleUndriveable = false

-- Some vehicles become really fast when a wheel falls off (blame Rockstar)
-- To prevent abuse you can limit the vehicle speed when the wheels fall off
Config.limitVehicleSpeed = true
-- Speed limit in kmh
Config.speedLimit = 50.0

-- There's a few decent wheel models to choose from https://gtahash.ru/?s=wheel
-- the 'prop_wheel_01' might fit more popular rims but the 'prop_tornado_wheel' has bouncy physics
Config.wheelModel = 'prop_wheel_01'
Config.wheelRim = 'prop_wheel_rim_03'

-- Vehicle classes https://docs.fivem.net/natives/?_0x29439776AAA00A62
Config.blacklist = {
    models = {
        'blazer',
        'blazer2',
        'blazer3',
        'blazer4',
        'blazer5',
        'monster',
        'monster3',
        'monster4',
        'monster5',
    },
    classes = {
        14, 15, 16, 21
    }
}


-- Fall damage based on the ground type the vehicle lands on

-- Surfaces which are counted as road (https://docs.fivem.net/natives/?_0xA7F04022)
Config.roadSurfaces = {
    1, 3, 4, 12
}

-- If you define a model specific multiplier it will be used instead of the class multiplier
-- Multiplier that will be used for falls that land on dirt / non road(road like) material
Config.offroadFallDamageMultiplier = {
    models = {
        bf400 = 0.3,
        sanchez = 0.3,
        sanchez2 = 0.3,
        manchez = 0.3,
        buggy = 0.7,
    },
    classes = {
        [0] = 1.0, -- Compacts
        [1] = 1.0, -- Sedans
        [2] = 0.9, -- SUVs
        [3] = 1, -- Coupes
        [4] = 0.9, -- Muscle
        [5] = 1.3, -- Sports Classics
        [6] = 1.3, -- Sports
        [7] = 1.3, -- Super
        [8] = 1.0, -- Motorcycles
        [9] = 0.7, -- Off-road
        [10] = 0.9, -- Industrial
        [11] = 1, -- Utility
        [12] = 1.2, -- Vans
        [13] = 0.6, -- Cycles
        [14] = 0, -- Boats
        [15] = 0, -- Helicopters
        [16] = 0, -- Planes
        [17] = 0.9, -- Service
        [18] = 0.5, -- Emergency
        [19] = 0.2, -- Military
        [20] = 0.7, -- Commercial
        [21] = 0, -- Trains
    }
}

