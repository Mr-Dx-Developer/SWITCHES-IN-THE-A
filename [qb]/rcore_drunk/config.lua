Config = {}

--- will enable debug
Config.Debug = false

Config.FrameworkType = {
    -- 0 = standalone
    -- 1 = esx
    -- 2 = qbcore
    Active = 2,

    -- esx
    ESX_SHARED_OBJECT = "esx:getSharedObject",

    -- es_extended resource name
    ES_EXTENDED_NAME = "es_extended",

    -------

    -- qbcore
    QBCORE_SHARED_OBJECT = "QBCore:GetObject",

    -- qb-core resource name
    QB_CORE_NAME = "qb-core",

    -- enable framework detection?
    enableDetection = true,
}

-- disable death detection if player died (this will disable the player drunk effects)
Config.DisableDeathDetection = false

-- will disable mysql
Config.DisableMySQL = false

-- When you will drink from table it will show after 200ms the real position in world to your config.lua
-- set it to true to enable (dont run on server with players)
Config.ForceShowCoords = false

-- if you're using ox_inv for exports item
Config.ox_inv = false

Config.MaximumMilligramsInBlood = 6.09

-- will enable default hud
Config.EnableHud = true

-- key to sip from bottle
Config.BindToSip = "G"

-- key to throw away the bottle in hand
Config.BindToThrowAwayBind = "H"

-- when you're near table with drink on it
Config.BindToTakeBottleFromTable = "E"

-- exiting the animation from table
Config.BindToLeaveTable = "BACK"

-- en, cs
Config.Locale = "en"

--- Who is allowed to give to the player the test machine for alcohol? Use command /givetest
Config.WhitelistedJobsToTestBreath = {
    "police",
    "lspd",
    "funkypolice",
    "president of Czechia"
}

Config.MakePlayerNPC = function(enable)
    local ped = PlayerPedId()

    SetBlockingOfNonTemporaryEvents(ped, enable)
    FreezeEntityPosition(ped, enable)

    -- disabled because it may have problem with anticheat
    --SetEntityInvincible(ped, enable)
end

-- (DO NOT CHANGE ANYTHING)
DefaultAttachmentPropertiesOfItem = {
    boneId = 18905,
    objectHash = GetHashKey("prop_amb_beer_bottle"),

    positionHoldOffset = vector3(0.1, -0.05, 0.05),
    positionDrinkOffset = vector3(0.1, -0.05, 0.05),

    rotationHoldOffset = vector3(-110.0, -20, 0),
    rotationDrinkoffset = vector3(-110.0, -90.0, 10.0),

    -- after finished drinking this will insta remove bottle he is holding
    removeBottle = false,
}

-- Configurable drunk list
-- here you can add your own item that can be drinkable
Config.DrunkList = {
    {
        name = "beer",
        numbersOfSips = 5, -- max 5 sips then the vodka bottle will be empty.
        eachSipGiveDrunk = 2, -- 2 * 5 = 10% drunk from one beer if he drink whole
        attachmentInfo = DefaultAttachmentPropertiesOfItem,

        -- this is optional if its commented out nothing will be given to player
        -- will not work on standalone
        --giveEmptyBottle = "bread",
    },
    {
        name = "vodka",
        numbersOfSips = 1,
        eachSipGiveDrunk = 5,
        attachmentInfo = {
            boneId = 18905,
            objectHash = GetHashKey("prop_cs_shot_glass"),

            positionHoldOffset = vector3(0.1, 0.00, 0.02),
            positionDrinkOffset = vector3(0.1, -0.05, 0.05),

            rotationHoldOffset = vector3(-110.0, -20, 0),
            rotationDrinkoffset = vector3(-110.0, -90.0, 10.0),
        },

        -- this is optional if its commented out nothing will be given to player
        -- will not work on standalone
        --giveEmptyBottle = "bottle_of_beer",
    },
    {
        name = "whiskey",
        numbersOfSips = 3,
        eachSipGiveDrunk = 5,
        attachmentInfo = {
            boneId = 18905,
            objectHash = GetHashKey("p_whiskey_bottle_s"),

            positionHoldOffset = vector3(0.1, -0.05, 0.05),
            positionDrinkOffset = vector3(0.1, -0.05, 0.05),

            rotationHoldOffset = vector3(-110.0, -20, 0),
            rotationDrinkoffset = vector3(-110.0, -90.0, 10.0),
        },

        -- this is optional if its commented out nothing will be given to player
        -- will not work on standalone
        --giveEmptyBottle = "bottle_of_beer",
    },
    {
        name = "wine",
        numbersOfSips = 3,
        eachSipGiveDrunk = 5,
        attachmentInfo = {
            boneId = 18905,
            objectHash = GetHashKey("p_wine_glass_s"),

            -- Because the object "glasas wine" doesnt have any psychics this will simply simulate the fall.
            simulateFall = true,

            positionHoldOffset = vector3(0.1, 0.00, 0.02),
            positionDrinkOffset = vector3(0.1, 0.00, 0.05),

            rotationHoldOffset = vector3(-110.0, -20, 0),
            rotationDrinkoffset = vector3(-110.0, -90.0, 10.0),
        },

        -- this is optional if its commented out nothing will be given to player
        -- will not work on standalone
        --giveEmptyBottle = "bottle_of_beer",
    },
}

--- ESX Events
Config.ExtendedEvents = {
    PlayerLoaded = "esx:playerLoaded",
    SetJob = "esx:setJob",
}

--- QBCore
Config.QBCoreEvents = {
    OnPlayerLoaded = "QBCore:Client:OnPlayerLoaded",
    OnJobUpdate = "QBCore:Client:OnJobUpdate",
}

--- Enable 3D text above player with how drunk he is?
Config.EnablePlayer3DText = true

--- 10% will be removed from drunk level after player vomit
Config.RemoveDrunkAfterVomit = 10

--- Interval when we remove the % from drunk status?
Config.IntervalForRemoveStatus = 11000

--- how many percent in the interval we shall take from current drunk level?
Config.DrunkTakeAfterTime = 1.5 -- %

--- How many percent player need to be
--- drunk to random events in vehicle happens?
Config.MinimumDrunkPercentageForVehicle = 40.0

--- How many percent chance is there to vehicele random event? in %
Config.ChanceForVehicleEvent = 50.0

--- How many percent player need to be
--- drunk for falling to ground randomly?
Config.MinimumDrunkPercentageForFalling = 25.0

--- How many percent chance is there to fall? in %
Config.ChanceForFalling = 60.0

--- How much drunk player has to be for hearing echo?
Config.MinimumDrunkPercentageForEcho = 50.0

--- Maximum drunk level? if player hits this value he will fall to the ground
--- and be unconscious
Config.MaximumDrunkPercentage = 85.0

--- Vehicle random action
--- All ID's can be found here.
--- https://docs.fivem.net/natives/?_0xC429DCEEB339E129
Config.VehicleRandomAction = {
    { action = 1, time = 1500 }, -- brake
    { action = 6, time = 1500 }, -- brake strong (handbrake?) until time ends
    { action = 9, time = 1500 }, -- weak acceleration
    { action = 23, time = 1500 }, -- accelerate fast
    { action = 24, time = 1500 }, -- brake
    { action = 31, time = 1500 }, -- accelerate + handbrake
    { action = 32, time = 1500 }, -- accelerate very strong
}

-- Drunk level enum (DO NOT CHANGE ANYTHING)
DrunkLevel = {
    NONE = 0,
    LITTLE = 1,
    MODERATELY = 2,
    HIGH = 3,
    MAXIMUM = 4,
}

-- Drunker types (DO NOT CHANGE ANYTHING)
DrunkerType = {
    LIGHT = 0,
    NORMAL = 1,
    HEAVY = 2,
}

-- Drinkable types (DO NOT CHANGE ANYTHING)
DrinkableTypes = {
    WHISKEY = 1,
    WINE = 2,
    BEER = 3,
}

-- how many percent the drinking stations will give?
DrinkableTypesAlcoholPercentage = {
    [DrinkableTypes.WHISKEY] = 5.0,
    [DrinkableTypes.WINE] = 3.0,
    [DrinkableTypes.BEER] = 2.0,
}

-- if you want to have smooth camera moving to focus on player when drinking from table.
Config.SmoothCameraToFocusPlayer = false

-- for some reason... Some interiors ID do not want to have forced interior ID where they should render...
-- and if you do they will be invisible so if you find any that has this weird behaviour just put them in ignore list
-- you can view the ID when you enable debug it will say "creating local object in interior ID"
Config.IgnoredInterios = {
    -- michael house ID
    [166401] = true,
    -- parking place
    [137729] = true,
}

-- configurable drinking stations
-- you can find the list in folder "alcoholStations"
Config.DrinkTable = {
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.BEER,

        -- Offset of height
        OffsetHeight = -0.06,

        -- Scene player + bottle + glass pos
        Position = vector3(1975.86, 3818.92, 33.63),

        -- glass & bottle position 
        Bottle = vec3(0.000000, 0.000000, 0.000000),
        Glass = vec3(1975.859985, 3818.919922, 33.570087),

        -- glass & bottle position 
        BottleRotation = 0.0,
        GlassRotation = 249.9977722168,

        -- Must face to the drink
        PlayerRotation = -110.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WHISKEY,

        -- Offset of height
        OffsetHeight = -0.08,

        -- Scene player + bottle + glass pos
        Position = vector3(-800.62, 184.14, 72.62),

        -- glass & bottle position 
        Bottle = vec3(-800.372009, 184.159454, 72.651756),
        Glass = vec3(-800.619995, 184.139999, 72.559715),
        BottleRotation = 359.10400390625,
        GlassRotation = 90.0,


        -- Must face to the drink
        PlayerRotation = 0.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WHISKEY,

        -- Offset of height
        OffsetHeight = -0.06,

        -- Scene player + bottle + glass pos
        Position = vector3(-796.6, 337.7, 158.6),

        -- glass & bottle position 
        Bottle = vec3(-796.619385, 337.947998, 158.651749),
        Glass = vec3(-796.599976, 337.700012, 158.559723),

        -- Rotation of glass & bottle 
        BottleRotation = 89.108558654785,
        GlassRotation = 89.999992370605,

        -- Must face to the drink
        PlayerRotation = 90.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WINE,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            GetHashKey("p_pour_wine_s"),
        },

        -- Offset of height
        OffsetHeight = -0.2,

        -- player start position
        Position = vector3(-793.7, 333.22, 157.79),

        -- glass & bottle position 
        Bottle = vec3(-793.774963, 332.931488, 158.757828),
        Glass = vec3(-793.599304, 333.003754, 158.757767),

        -- Rotation of glass & bottle 
        BottleRotation = 281.01965332031,
        GlassRotation = 271.50018310547,

        -- Must face to the drink
        PlayerRotation = -180.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WHISKEY,

        -- Offset of height
        OffsetHeight = 0.07,

        -- player start position
        Position = vector3(987.5, -96.47, 74.85),

        -- glass & bottle position 
        Bottle = vec3(987.677429, -96.295708, 75.031754),
        Glass = vec3(987.500000, -96.470001, 74.939713),
        BottleRotation = 39.103256225586,
        GlassRotation = 130.00001525879,

        -- Must face to the drink
        PlayerRotation = 40.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WHISKEY,

        -- Offset of height
        OffsetHeight = 0.04,

        -- player start position
        Position = vector3(1122.28, -3146.07, -37.06),

        -- glass & bottle position 
        Bottle = vec3(1122.303955, -3145.822510, -36.908241),
        Glass = vec3(1122.280029, -3146.070068, -37.000282),
        BottleRotation = 79.10676574707,
        GlassRotation = 170.00001525879,

        -- Must face to the drink
        PlayerRotation = 80.0,
    },
    {
        -- how far away the camera will be from player ?
        -- If the camera is behind wall it will disable interior so use this to fix the camera.
        ForwardMeters = 1.0,
        RotationOffSet = vector3(-10, 0, 0),
        FieldOfView = 75.0,

        -- Type of drink
        DrinkableType = DrinkableTypes.BEER,

        -- Offset of height
        OffsetHeight = 0.09,

        -- player start position
        Position = vector3(266.27, -996.61, -99.01),

        -- glass & bottle position 
        Bottle = vec3(0.000000, 0.000000, 0.000000),
        Glass = vec3(266.270020, -996.609985, -98.920006),
        BottleRotation = 0.0,
        GlassRotation = 220.00341796875,


        -- Must face to the drink
        PlayerRotation = 220.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WHISKEY,

        -- Offset of height
        OffsetHeight = -0.06,

        -- player start position
        Position = vector3(341.8, -1001.56, -99.2),

        -- glass & bottle position 
        Bottle = vec3(341.823883, -1001.312378, -99.148239),
        Glass = vec3(341.799988, -1001.559998, -99.240280),
        BottleRotation = 79.10676574707,
        GlassRotation = 170.00001525879,

        -- Must face to the drink
        PlayerRotation = 80.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WINE,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            GetHashKey("p_pour_wine_s"),
        },

        -- Offset of height
        OffsetHeight = -1.035,

        -- player start position
        Position = vector3(-13.19, -583.47, 79.46),

        -- glass & bottle position 
        Bottle = vec3(-12.944664, -583.639160, 79.592705),
        Glass = vec3(-12.952322, -583.449219, 79.592766),

        BottleRotation = 351.14147949219,
        GlassRotation = 341.50582885742,

        -- Must face to the drink
        PlayerRotation = -110.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WINE,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            GetHashKey("p_pour_wine_s"),
        },

        -- Offset of height
        OffsetHeight = -1.0,

        -- player start position
        Position = vector3(-35.77, -583.36, 88.71),

        -- glass & bottle position 
        Bottle = vec3(-35.939102, -583.605469, 88.877831),
        Glass = vec3(-35.749298, -583.597656, 88.877769),
        BottleRotation = 261.01965332031,
        GlassRotation = 251.50018310547,

        -- Must face to the drink
        PlayerRotation = 160.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WHISKEY,

        -- Offset of height
        OffsetHeight = -0.06,

        -- player start position
        Position = vector3(-36.97, -578.11, 88.71),

        -- glass & bottle position 
        Bottle = vec3(-36.946095, -577.862366, 88.761757),
        Glass = vec3(-36.970001, -578.109985, 88.669716),

        BottleRotation = 79.10676574707,
        GlassRotation = 169.99998474121,

        -- Must face to the drink
        PlayerRotation = 80.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WINE,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            GetHashKey("p_pour_wine_s"),
        },

        -- Offset of height
        OffsetHeight = -1.015,

        -- player start position
        Position = vector3(-1473.81, -539.74, 73.44),

        -- glass & bottle position 
        Bottle = vec3(-1473.889282, -539.452637, 73.592712),
        Glass = vec3(-1474.005493, -539.603088, 73.592773),

        BottleRotation = 131.12690734863,
        GlassRotation = 121.50582122803,

        -- Must face to the drink
        PlayerRotation = 30.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WINE,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            GetHashKey("p_pour_wine_s"),
        },

        -- Offset of height
        OffsetHeight = -1.015,

        -- player start position
        Position = vector3(-1466.51, -535.39, 55.53),

        -- glass & bottle position 
        Bottle = vec3(-1466.430786, -535.677368, 55.682713),
        Glass = vec3(-1466.314575, -535.526917, 55.682774),

        BottleRotation = 311.1194152832,
        GlassRotation = 301.505859375,

        -- Must face to the drink
        PlayerRotation = -150.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WHISKEY,

        -- Offset of height
        OffsetHeight = -0.06,

        -- player start position
        Position = vector3(-1471.55, -533.2, 55.53),

        -- glass & bottle position 
        Bottle = vec3(-1471.724365, -533.022583, 55.581757),
        Glass = vec3(-1471.550049, -533.200012, 55.489716),

        BottleRotation = 129.10932922363,
        GlassRotation = 220.00001525879,

        -- Must face to the drink
        PlayerRotation = 130.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WINE,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            GetHashKey("p_pour_wine_s"),
        },

        -- Offset of height
        OffsetHeight = -1.01,

        -- player start position
        Position = vector3(-916.46, -386.35, 113.67),

        -- glass & bottle position 
        Bottle = vec3(-916.756714, -386.378082, 113.827705),
        Glass = vec3(-916.628723, -386.518677, 113.827766),

        BottleRotation = 211.12860107422,
        GlassRotation = 201.50584411621,

        -- Must face to the drink
        PlayerRotation = 110.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WINE,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            GetHashKey("p_pour_wine_s"),
        },

        -- Offset of height
        OffsetHeight = -1.01,

        -- player start position
        Position = vector3(-616.1, 41.77, 97.6),

        -- glass & bottle position 
        Bottle = vec3(-616.370972, 41.894035, 97.757706),
        Glass = vec3(-616.330444, 41.708282, 97.757767),

        BottleRotation = 181.13526916504,
        GlassRotation = 171.50582885742,

        -- Must face to the drink
        PlayerRotation = 80.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WINE,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            GetHashKey("p_pour_wine_s"),
        },

        -- Offset of height
        OffsetHeight = -1.01,

        -- player start position
        Position = vector3(-771.89, 340.83, 211.4),

        -- glass & bottle position 
        Bottle = vec3(-771.601624, 340.754913, 211.557709),
        Glass = vec3(-771.673767, 340.930786, 211.557770),

        BottleRotation = 11.146078109741,
        GlassRotation = 1.5058405399323,

        -- Must face to the drink
        PlayerRotation = -90.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WINE,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            GetHashKey("p_pour_wine_s"),
        },

        -- Offset of height
        OffsetHeight = -0.94,

        -- player start position
        Position = vector3(-168.46, 491.7, 137.44),

        -- glass & bottle position 
        Bottle = vec3(-168.539169, 491.987335, 137.667709),
        Glass = vec3(-168.655426, 491.836884, 137.667770),

        BottleRotation = 131.14067077637,
        GlassRotation = 121.50582122803,

        -- Must face to the drink
        PlayerRotation = 30.0,
    },
    {
        -- how far away the camera will be from player ?
        -- If the camera is behind wall it will disable interior so use this to fix the camera.
        ForwardMeters = 1.1,
        RotationOffSet = vector3(-15, 0, 0),
        FieldOfView = 85.0,

        -- Type of drink
        DrinkableType = DrinkableTypes.WHISKEY,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            1480049515,
        },

        -- Offset of height
        OffsetHeight = -0.015,

        -- player start position
        Position = vector3(-171.1, 482.04, 137.24),

        -- glass & bottle position 
        Bottle = vec3(-171.162186, 482.280823, 137.336761),
        Glass = vec3(-171.100006, 482.040009, 137.244720),

        BottleRotation = 99.109252929688,
        GlassRotation = 190.0,

        -- Must face to the drink
        PlayerRotation = 100.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WINE,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            GetHashKey("p_pour_wine_s"),
        },

        -- Offset of height
        OffsetHeight = -0.94,

        -- player start position
        Position = vector3(337.76, 430.55, 149.17),

        -- glass & bottle position 
        Bottle = vec3(338.047333, 430.629181, 149.397705),
        Glass = vec3(337.896881, 430.745392, 149.397766),

        BottleRotation = 41.139789581299,
        GlassRotation = 31.505834579468,

        -- Must face to the drink
        PlayerRotation = -60.0,
    },
    {
        -- how far away the camera will be from player ?
        -- If the camera is behind wall it will disable interior so use this to fix the camera.
        ForwardMeters = 1.1,
        RotationOffSet = vector3(-15, 0, 0),
        FieldOfView = 85.0,

        -- Type of drink
        DrinkableType = DrinkableTypes.WHISKEY,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            1480049515,
        },

        -- Offset of height
        OffsetHeight = -0.015,

        -- player start position
        Position = vector3(327.82, 430.61, 148.97),

        -- glass & bottle position 
        Bottle = vec3(328.025024, 430.750793, 149.066757),
        Glass = vec3(327.820007, 430.609985, 148.974716),

        BottleRotation = 29.103841781616,
        GlassRotation = 119.99998474121,

        -- Must face to the drink
        PlayerRotation = 30.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WINE,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            GetHashKey("p_pour_wine_s"),
        },

        -- Offset of height
        OffsetHeight = -0.94,

        -- player start position
        Position = vector3(374.88, 415.69, 145.7),

        -- glass & bottle position 
        Bottle = vec3(375.167328, 415.769196, 145.927704),
        Glass = vec3(375.016876, 415.885406, 145.927765),

        BottleRotation = 41.141490936279,
        GlassRotation = 31.505834579468,

        -- Must face to the drink
        PlayerRotation = -60.0,
    },
    {
        -- how far away the camera will be from player ?
        -- If the camera is behind wall it will disable interior so use this to fix the camera.
        ForwardMeters = 1.1,
        RotationOffSet = vector3(-15, 0, 0),
        FieldOfView = 85.0,

        -- Type of drink
        DrinkableType = DrinkableTypes.WHISKEY,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            1480049515,
        },

        -- Offset of height
        OffsetHeight = -0.015,

        -- player start position
        Position = vector3(368.6, 407.87, 145.55),

        -- glass & bottle position 
        Bottle = vec3(368.623932, 408.117554, 145.646759),
        Glass = vec3(368.600006, 407.869995, 145.554718),

        BottleRotation = 79.10767364502,
        GlassRotation = 169.99998474121,

        -- Must face to the drink
        PlayerRotation = 80.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WINE,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            GetHashKey("p_pour_wine_s"),
        },

        -- Offset of height
        OffsetHeight = -0.94,

        -- player start position
        Position = vector3(-674.41, 590.15, 145.17),

        -- glass & bottle position 
        Bottle = vec3(-674.622192, 590.359253, 145.397705),
        Glass = vec3(-674.647644, 590.170837, 145.397766),

        BottleRotation = 161.15887451172,
        GlassRotation = 151.50582885742,

        -- Must face to the drink
        PlayerRotation = 60.0,
    },
    {
        -- how far away the camera will be from player ?
        -- If the camera is behind wall it will disable interior so use this to fix the camera.
        ForwardMeters = 1.1,
        RotationOffSet = vector3(-15, 0, 0),
        FieldOfView = 85.0,

        -- Type of drink
        DrinkableType = DrinkableTypes.WHISKEY,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            1480049515,
        },

        -- Offset of height
        OffsetHeight = -0.015,

        -- player start position
        Position = vector3(-671.95, 580.5, 144.97),

        -- glass & bottle position 
        Bottle = vec3(-672.124268, 580.677429, 145.066757),
        Glass = vec3(-671.950012, 580.500000, 144.974716),

        BottleRotation = 129.10932922363,
        GlassRotation = 220.00001525879,

        -- Must face to the drink
        PlayerRotation = 130.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WINE,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            GetHashKey("p_pour_wine_s"),
        },

        -- Offset of height
        OffsetHeight = -0.94,

        -- player start position
        Position = vector3(-763.47, 612.52, 143.93),

        -- glass & bottle position 
        Bottle = vec3(-763.172913, 612.496216, 144.157700),
        Glass = vec3(-763.274536, 612.656860, 144.157761),

        BottleRotation = 21.145711898804,
        GlassRotation = 11.505840301514,

        -- Must face to the drink
        PlayerRotation = -80.0,
    },
    {
        -- how far away the camera will be from player ?
        -- If the camera is behind wall it will disable interior so use this to fix the camera.
        ForwardMeters = 1.1,
        RotationOffSet = vector3(-15, 0, 0),
        FieldOfView = 85.0,

        -- Type of drink
        DrinkableType = DrinkableTypes.WHISKEY,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            1480049515,
        },

        -- Offset of height
        OffsetHeight = -0.015,

        -- player start position
        Position = vector3(-773.4, 613.88, 143.73),

        -- glass & bottle position 
        Bottle = vec3(-773.159241, 613.942200, 143.826752),
        Glass = vec3(-773.400024, 613.880005, 143.734711),

        BottleRotation = 9.1042442321777,
        GlassRotation = 99.999992370605,

        -- Must face to the drink
        PlayerRotation = 10.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WINE,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            GetHashKey("p_pour_wine_s"),
        },

        -- Offset of height
        OffsetHeight = -0.94,

        -- player start position
        Position = vector3(-856.21, 683.99, 152.65),

        -- glass & bottle position 
        Bottle = vec3(-855.967163, 684.162659, 152.877701),
        Glass = vec3(-856.148254, 684.220459, 152.877762),

        BottleRotation = 61.206565856934,
        GlassRotation = 51.505840301514,

        -- Must face to the drink
        PlayerRotation = -40.0,
    },
    {
        -- how far away the camera will be from player ?
        -- If the camera is behind wall it will disable interior so use this to fix the camera.
        ForwardMeters = 1.1,
        RotationOffSet = vector3(-15, 0, 0),
        FieldOfView = 85.0,

        -- Type of drink
        DrinkableType = DrinkableTypes.WHISKEY,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            1480049515,
        },

        -- Offset of height
        OffsetHeight = -0.015,

        -- player start position
        Position = vector3(-859.71, 674.7, 152.45),

        -- glass & bottle position 
        Bottle = vec3(-859.729431, 674.947937, 152.546753),
        Glass = vec3(-859.710022, 674.700012, 152.454712),

        BottleRotation = 89.10856628418,
        GlassRotation = 179.99998474121,

        -- Must face to the drink
        PlayerRotation = 90.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WINE,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            GetHashKey("p_pour_wine_s"),
        },

        -- Offset of height
        OffsetHeight = -0.94,

        -- player start position
        Position = vector3(121.12, 552.79, 184.1),

        -- glass & bottle position 
        Bottle = vec3(121.362915, 552.962646, 184.327713),
        Glass = vec3(121.181786, 553.020447, 184.327774),

        BottleRotation = 61.134590148926,
        GlassRotation = 51.505840301514,

        -- Must face to the drink
        PlayerRotation = -40.0,
    },
    {
        -- how far away the camera will be from player ?
        -- If the camera is behind wall it will disable interior so use this to fix the camera.
        ForwardMeters = 1.1,
        RotationOffSet = vector3(-15, 0, 0),
        FieldOfView = 85.0,

        -- Type of drink
        DrinkableType = DrinkableTypes.WHISKEY,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            1480049515,
        },

        -- Offset of height
        OffsetHeight = -0.015,

        -- player start position
        Position = vector3(117.83, 543.43, 183.9),

        -- glass & bottle position 
        Bottle = vec3(117.810577, 543.677917, 183.996750),
        Glass = vec3(117.830002, 543.429993, 183.904709),

        BottleRotation = 89.10856628418,
        GlassRotation = 179.99998474121,

        -- Must face to the drink
        PlayerRotation = 90.0,
    },
    {
        -- Type of drink
        DrinkableType = DrinkableTypes.WINE,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            GetHashKey("p_pour_wine_s"),
        },

        -- Offset of height
        OffsetHeight = -0.94,

        -- player start position
        Position = vector3(-1286.76, 442.13, 97.69),

        -- glass & bottle position 
        Bottle = vec3(-1286.517090, 442.302673, 97.917709),
        Glass = vec3(-1286.698242, 442.360443, 97.917770),

        BottleRotation = 61.133899688721,
        GlassRotation = 51.505840301514,

        -- Must face to the drink
        PlayerRotation = -40.0,
    },
    {
        -- how far away the camera will be from player ?
        -- If the camera is behind wall it will disable interior so use this to fix the camera.
        ForwardMeters = 1.1,
        RotationOffSet = vector3(-15, 0, 0),
        FieldOfView = 85.0,

        -- Type of drink
        DrinkableType = DrinkableTypes.WHISKEY,

        --  For some reason there are not always correct props with the bottle whiskey. List where you can remove those
        HideProps = {
            1480049515,
        },

        -- Offset of height
        OffsetHeight = -0.015,

        -- player start position
        Position = vector3(-1290.89, 433.1, 97.5),

        -- glass & bottle position 
        Bottle = vec3(-1290.909424, 433.347961, 97.596756),
        Glass = vec3(-1290.890015, 433.100006, 97.504715),

        BottleRotation = 89.10856628418,
        GlassRotation = 179.99998474121,

        -- Must face to the drink
        PlayerRotation = 90.0,
    },
    {
        -- how far away the camera will be from player ?
        -- If the camera is behind wall it will disable interior so use this to fix the camera.
        --ForwardMeters = 1.0,
        --RotationOffSet = vector3(-10,0,0),
        --FieldOfView = 75.0,

        -- Type of drink
        DrinkableType = DrinkableTypes.BEER,

        -- Offset of height
        OffsetHeight = 0.19,

        -- player start position
        Position = vector3(-1585.38, -3016.28, -76.01),

        -- glass & bottle position 
        Bottle = vec3(0.000000, 0.000000, 0.000000),
        Glass = vec3(-1585.380005, -3016.280029, -75.819977),

        BottleRotation = 0.0,
        GlassRotation = 260.00451660156,


        -- Must face to the drink
        PlayerRotation = 260.0,
    },
}

-- settings for some effects
Config.SettingsForEffects = {
    Vomit = {
        MinimumLevel = DrunkLevel.HIGH,
        ChanceToTrigger = 20, -- 20 = 20%
        IntervalTimer = 30000,
    },
    RandomShoot = {
        MinimumLevel = DrunkLevel.HIGH,
        ChanceToTrigger = 30, -- 30 = 30%
        IntervalTimer = 30000,
    },
}

--- Player shake camera intensity for each drunk level
DrunkCameraIntensity = {
    [DrunkLevel.LITTLE] = 0.1,
    [DrunkLevel.MODERATELY] = 0.3,
    [DrunkLevel.HIGH] = 0.6,
    [DrunkLevel.MAXIMUM] = 1.0,
}

--- Player camera effect intesity level
DrunkEffectIntensity = {
    [DrunkLevel.LITTLE] = 0.1,
    [DrunkLevel.MODERATELY] = 0.45,
    [DrunkLevel.HIGH] = 0.8,
    [DrunkLevel.MAXIMUM] = 1.0,
}

--- Player walking style list for drunk levels
DrunkWalkList = {
    [DrunkLevel.MODERATELY] = "move_m@drunk@slightlydrunk",
    [DrunkLevel.HIGH] = "move_m@drunk@moderatedrunk",
    [DrunkLevel.MAXIMUM] = "move_m@drunk@verydrunk",
}