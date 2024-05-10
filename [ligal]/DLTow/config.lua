--------- TUTORIAL VIDEO FOR ADDING NEW TRAILERS: ---------

-- https://www.youtube.com/watch?v=KB-gN-88OyA

-----------------------------------------------------------
ConfigTow = {}
-- AUTOMATIC ATTACH --
ConfigTow.AutomaticAttach = true -- vehicle will get automatically attached when on a trailer/flatbed and fully stopped
    ConfigTow.AutomaticAttachDelay = 1 -- delay in seconds after the automatic detach
    ConfigTow.ShowAutomaticText = true -- set to false if you want to hide the speed, attached or detached text on top of the vehicle
    ConfigTow.MaxSpeedForAutomaticAttach = 1 -- speed in km/h under which the vehicle will be attached
-- JOB WHITELIST --
ConfigTow.WhitelistJobOnly = false -- set to true if using whitelist jobs, only for ESX or QB Core
    ConfigTow.Framework = "Standalone" -- Standalone, ESX, QB (ESX or QB used for job check)
    ConfigTow.FrameworkCore = 'qb-core' -- es_extended, qb-core, if-core, ...
    ConfigTow.WhitelistJobs = { -- only with ESX or QB
    "mechanic",
    "tow",
    "police"
}

-- TRAILER AND FLATBED WHITELIST --
ConfigTow.whitelist = { -- when adding more trailers simply
-- write /rampadd next to the trailer
-- and use the name it shows after "Trying to attach ramp to"
    'FLATBED',
    'WASTLNDR',
    'BENSONC2',
    'MULE',
    'MULE2',
    'MULE3',
    'MULE4',
    'TRAILER',
    'ARMYTRAILER',
    'BOATTRAILER',
    'DLT40',
    'DLTB',
    'DLTS',
    'DLT1',
    'DLT2',
    'DLT3',
    'THAULER',
    'DLTD',
    'legacytrail',
    'dl550mec',
    'TITAN',
    'MULER',
    'flatbedm2',
    'DLTS7',
    'DLTS6',
    'DLTS5',
    'DLTS4',
    'DLTS3',
    'DLTS2',
    'DLTENC',
    'DLTENC2',
    'DLTENC3',
    'DLTENC4',
    'DLTBOAT',
    'DLTBOAT2',
    'DLTM',
    'DLTB2',
    'DLTB4',
    'dlf350',
    'dlnavi',
    'dlfram',
    'dlfford',
    'dlfsilv',

    ---'DBRTGf350',
  ---  'lottrusty',
   -- '23silverbi',
   -- 'GODzBLTSILV',
    'bigtexcf',
    '20fttrailer',
    'playaquanhawk',
    'DBRollBack4',
    'LG_Diamond_Utility',
    'bcthauler2',


    "foxtr1"




}
ConfigTow.blacklist = { -- vehicles that can not be attached on trailers or flatbeds
   -- 'FLATBED',
    'dl550mec'
}
-- RAMP CONFIG --
-- Modify the x y z coords to specify where the ramp needs to be created
-- Set hasRamp = true if your trailer has a ramp that can be opened by opening the trunk, xyz can be any coords, a ramp will not be added
-- If you don't want the option to add a ramp, then do not add the trailer here, only add to the whitelist above.
ConfigTow.offsets = {
  ---  {model = 'DBRTGf350', offset = {x = 0.0, y = -9.0, z = -1.25}, hasRamp = false},
   --- {model = 'lottrusty', offset = {x = 0.0, y = -9.0, z = -1.25}, hasRamp = false},
   -- {model = '23silverbi', offset = {x = 0.0, y = -9.0, z = -1.25}, hasRamp = false},
   -- {model = 'GODzBLTSILV', offset = {x = 0.0, y = -9.0, z = -1.25}, hasRamp = false},
    {model = 'bigtexcf', offset = {x = 0.0, y = -9.0, z = -1.25}, hasRamp = false},
    {model = '20fttrailer', offset = {x = 0.0, y = -9.0, z = -1.25}, hasRamp = false},
    {model = 'playaquanhawk', offset = {x = 0.0, y = -9.0, z = -1.25}, hasRamp = false},
    {model = 'DBRollBack4', offset = {x = 0.0, y = -9.0, z = -1.25}, hasRamp = false},
    {model = 'LG_Diamond_Utility', offset = {x = 0.0, y = -9.0, z = -1.25}, hasRamp = false},
    {model = 'bcthauler2', offset = {x = 0.0, y = -9.0, z = -1.25}, hasRamp = false},
    {model = 'foxtr1', offset = {x = 0.0, y = -9.0, z = -1.25}, hasRamp = false},




    {model = 'FLATBED', offset = {x = 0.0, y = -9.0, z = -1.25}, hasRamp = false},
    {model = 'WASTLNDR', offset = {x = 0.0, y = -7.2, z = -0.9}, hasRamp = false},
    {model = 'BENSONC2', offset = {x = 0.0, y = -8.4, z = -1.6}, hasRamp = false},
    {model = 'MULE', offset = {x = 0.0, y = -7.0, z = -1.75}, hasRamp = false},
    {model = 'MULE2', offset = {x = 0.0, y = -7.0, z = -1.75}, hasRamp = false},
    {model = 'MULE3', offset = {x = 0.0, y = -7.0, z = -1.75}, hasRamp = false},
    {model = 'MULE4', offset = {x = 0.0, y = -7.0, z = -1.75}, hasRamp = false},
    {model = 'TRAILER', offset = {x = 0.0, y = -9.0, z = -1.25}, hasRamp = false},
    {model = 'ARMYTRAILER', offset = {x = 0.0, y = -9.5, z = -3.0}, hasRamp = false},
    {model = 'DLT40', offset = {x = 0.0, y = -10.6, z = -1.90}, hasRamp = true},
    {model = 'DLTB', offset = {x = 0.0, y = -10.6, z = -1.90}, hasRamp = true},
    {model = 'DLTS', offset = {x = 0.0, y = -8.35, z = -1.85}, hasRamp = true},
    {model = 'DLT1', offset = {x = 0.0, y = 0.0, z = 0.0}, hasRamp = true},
    {model = 'DLT2', offset = {x = 0.0, y = 0.0, z = 0.0}, hasRamp = true},
    {model = 'DLT3', offset = {x = 0.0, y = 0.0, z = 0.0}, hasRamp = true},
    {model = 'THAULER', offset = {x = 0.0, y = 0.0, z = 0.0}, hasRamp = true},
    {model = 'DLTD', offset = {x = 0.0, y = 0.0, z = 0.0}, hasRamp = true},
    {model = 'legacytrail', offset = {x = 0.0, y = 0.0, z = 0.0}, hasRamp = true},
    {model = 'TITAN', offset = {x = 0.0, y = 0.0, z = 0.0}, hasRamp = true},
    {model = 'DLTS7', offset = {x = 0.0, y = 0.0, z = 0.0}, hasRamp = true},
    {model = 'DLTS6', offset = {x = 0.0, y = 0.0, z = 0.0}, hasRamp = true},
    {model = 'DLTS5', offset = {x = 0.0, y = 0.0, z = 0.0}, hasRamp = true},
    {model = 'DLTS4', offset = {x = 0.0, y = 0.0, z = 0.0}, hasRamp = true},
    {model = 'DLTS3', offset = {x = 0.0, y = 0.0, z = 0.0}, hasRamp = true},
    {model = 'DLTS2', offset = {x = 0.0, y = 0.0, z = 0.0}, hasRamp = true},
    {model = 'DLTENC', offset = {x = 0.0, y = 0.0, z = 0.0}, hasRamp = true},
    {model = 'DLTENC2', offset = {x = 0.0, y = 0.0, z = 0.0}, hasRamp = true},
    {model = 'DLTENC3', offset = {x = 0.0, y = 0.0, z = 0.0}, hasRamp = true},
    {model = 'DLTENC4', offset = {x = 0.0, y = 0.0, z = 0.0}, hasRamp = true},
    {model = 'DLTM', offset = {x = 0.0, y = 0.0, z = 0.0}, hasRamp = true},
    {model = 'DLTB2', offset = {x = 0.0, y = 0.0, z = 0.0}, hasRamp = true},
    {model = 'DLTB4', offset = {x = 0.0, y = 0.0, z = 0.0}, hasRamp = true},
}
-- if ramp has to be opened as an model extra, add the extra id here
ConfigTow.rampextra = {
    {modelextra = 'DLT3', extraID = 1},
    {modelextra = 'DLTS', extraID = 3},
    {modelextra = 'DLTS5', extraID = 1},
    {modelextra = 'DLTS2', extraID = 3},
    {modelextra = 'DLTB2', extraID = 2},
    {modelextra = 'DLTB4', extraID = 1},
    
}

-- boneIndex of the rollback bed can be found using OpenIV if not provided by the car maker
-- attachHeight = height from the bed where the vehicle is attached
-- attachDistance = distance from the bone where the vehicle is attached (for moving closer or further from the end of the bed)
ConfigTow.rollback = {
    

   
    {model = 'dl550mec', boneIndex = "misc_z", attachHeight = 0.08, attachDistance = 0.0},
    {model = 'dlf350', boneIndex = "misc_b", attachHeight = -0.05, attachDistance = 0.7},
    {model = 'dlnavi', boneIndex = "misc_b", attachHeight = -0.05, attachDistance = 0.0},
    {model = 'dlfram', boneIndex = "misc_b", attachHeight = -0.05, attachDistance = 0.0},
    {model = 'dlfford', boneIndex = "misc_b", attachHeight = 0.05, attachDistance = 0.7},
    {model = 'dlfsilv', boneIndex = "misc_b", attachHeight = -0.05, attachDistance = 0.0},
    {model = 'flatbedm2', boneIndex = "misc_a", attachHeight = 0.08, attachDistance = 0.0},
    {model = 'MULER', boneIndex = "misc_a", attachHeight = 0.08, attachDistance = 0.0},
    {model = 'DLTS4', boneIndex = "misc_a", attachHeight = -0.15, attachDistance = 0.0},
}
-- ramp prop
RampHash = 'imp_prop_flatbed_ramp'


-- CONFIG FOR WINCH --
Config = {
    -- Enable debug mode?
    debug         = false,
    -- Display towing status?
    displayStatus = true,
    -- Allow player towing NPC's car?
    allowNpcCar   = true,
    -- The minimum length of the rope in meters
    minRopeLength = 2.0,
    -- Maximum distance at which can start winching
    maxWinchDistance = 25.0,
    -- The maximum length of the rope in meters
    maxRopeLength = 45.0,
    -- If the vehicle over this speed, the rope will break (brokenSpeed * 3.6 for km/h)
    brokenSpeed   = 25.0,
    -- The length added to the rope per tick
    lengthTick    = 0.02,
    -- The key to increase the rope length
    addLength     = 208,
    -- The key to decrease the rope length
    reduceLength  = 207,
    -- Towing car offset
    towingOffset  = vector3(0.0, 0.0, 0.3),
    -- Translate
    texts         = {
        eAttach = "E - Attach",
        eDetach = "E - Detach",
        eAddRamp = "E - Add Ramp",
        eRemoveRamp = "E - Remove Ramp",
        eCloseRamp = "E - Close Ramp",
        eOpenRamp = "E - Open Ramp",
        showAttached = "Attached",
        showDetached = "Detached",
        showCarSpeed = "Speed",
        rampAttached = "Ramp Attached.",
        tranRampRemoved = "Ramp removed.",
        rampClosed = "Ramp closed.",
        rampOpened = "Ramp opened.",
        notJobAllowed = "Not allowed.",
        getOutOfVehicle = "Get out of the vehicle.",

        vehicleAttached = "Vehicle attached.",
        vehicleDetached = "Vehicle detached.",
        vehicleAlreadyAttached = "Vehicle is already attached.",
        vehicleNotAttached = "Vehicle is not attached.",
        tryingToAttach = "Trying to attach ramp to ",
        canNotAttach = "You can not attach your vehicle on ",
        canRampNotAttach = "You can not attach a ramp to this vehicle.",
        mustBeDriver = "You must be in the driver\'s seat.",
        notInCar = "You are not in a vehicle.",
        alreadyAttached = "There already is a vehicle attached.",


        invalidUsage = "Invalid winch usage. Use /winch 'up', 'down' or 'behind'",
        notNear = "You are not near a car!",
        towCarName = "Winch Car Name ~g~%s",
        towingName = "Car Being Winched Name ~o~%s",
        ropeLength = "Rope Length ~y~%.2f",
        helpNotice = "Select another car for winching\nPress ~INPUT_FRONTEND_RRIGHT~ to cancel",
        helpNotice2 = "~INPUT_SCRIPTED_FLY_ZDOWN~ - Less Rope\n~INPUT_SCRIPTED_FLY_ZUP~ - More Rope",
        ropeBroken = "Winch broken because the vehicle no longer exists",
        carTooFast = "Winch broken because the vehicle is too fast",
        towCarDone = "Set %s as winch car, now please select the car you need to winch",
        towingDone = "Now you are winching %s",
        notAllowed = "This vehicle is not allowed to winch another vehicle",
        tooFarAway = "The winching car is too far away move it closer and try again.",
        towRemoved = "The winch has been removed",
    },
}