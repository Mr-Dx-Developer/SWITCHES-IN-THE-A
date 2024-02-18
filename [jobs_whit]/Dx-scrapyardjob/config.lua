Config = {}

Config.VehicleModel = "emperor2"
Config.DoorModel = "prop_car_door_01"
Config.TebleModel = "prop_rub_table_02"
Config.DoorAnimationDict = "anim@heists@box_carry@"
Config.DoorAnimation = "idle"
--Config.RemoveAnimationDict = "anim@amb@clubhouse@tutorial@bkr_tut_ig3@"
--Config.RemoveAnimation = "machinic_loop_mechandplayer"
Config.RemoveAnimation = "WORLD_HUMAN_WELDING"
Config.DemolishingAnimationDict = "mini@repair"
Config.DemolishingAnimation = "fixing_a_ped"
Config.Reward = "metalscrap"
Config.CooldownTime = 10


ChopBlip = {
	["chop"] = {
		label = "Scrapyard",
		pos = vector4(2404.24, 3127.52, 48.15, 71.36),
		showBlip = true
	},
}

Config.ChopingLocations = {
    ["Positions"] = {
        [1] = {
            spawn = vector4(2421.06, 3111.48, 47.65, 109.66), 
            TeblePos = vector3(2415.24, 3110.27, 48.15),
            label = "pos1",
        },
        [2] = {
            spawn = vector4(2419.25, 3105.35, 47.64, 77.55), 
            TeblePos = vector3(2414.0, 3106.26, 48.15),
            label = "pos2",
        },
        [3] = {    
            spawn = vector4(2415.56, 3099.12, 47.64, 30.63), 
            TeblePos = vector3(2411.43, 3103.81, 48.15),      
            label = "pos3",
        },
        [4] = {    
            spawn = vector4(2408.95, 3093.98, 47.64, 3.68),   
            TeblePos = vector3(2407.61, 3099.47, 48.15),     
            label = "pos4",
            
        },
    }
}

Config.Labels = {
    ["hood"]        =    {label = "Hood", id = 4},
    ["frontleft"]   =    {label = "Front left door", id = 0},
    ["backleft"]    =    {label = "Back left door", id = 2},
    ["trunk"]       =    {label = "Trunk", id = 5},
    ["backright"]   =    {label ="Back right door", id = 3},
    ["frontright"]  =    {label ="Front right door", id = 1},
    ----extras
    ["engine"]      =    {label = "Engine",  doing = "engine",  prop = "prop_car_engine_01"},
    ["seat1"]       =    {label = "Left Seat", doing = "seat1", prop = "prop_rub_carpart_05"},
    ["seat2"]       =    {label = "Right Seat", doing = "seat2", prop = "prop_rub_carpart_05"},
    ["exaust"]      =    {label = "Exaust", doing = "exaust", prop = "prop_car_exhaust_01"},
}


Config.DoorTextPos = {
    ["pos1"] ={ 
        hood        =   vector3(2418.35, 3110.64, 48.15),   ---hood
        frontleft   =   vector3(2421.58, 3110.1, 48.15),    --- front left
        backleft    =   vector3(2422.6, 3110.59, 48.15),    --- back left 
        trunk       =   vector3(2424.3, 3112.69, 48.18),    --- trunk
        backright   =   vector3(2421.65, 3113.06, 48.15),   --- back right
        frontright  =   vector3(2420.63, 3112.72, 48.15),   --- front right
    }, 
    ["pos2"] = {
        hood        =   vector3(2416.62, 3105.97, 48.15),
        frontleft   =   vector3(2418.99, 3104.06, 48.15),
        backleft    =   vector3(2420.09, 3103.78, 48.15),
        trunk       =   vector3(2422.47, 3104.74, 48.15),
        backright   =   vector3(2420.65, 3106.43, 48.15),
        frontright  =   vector3(2419.59, 3106.65, 48.15),
    },
    ["pos3"] = {
        hood        =   vector3(2414.25, 3101.44, 48.15),
        frontleft   =   vector3(2414.43, 3098.39, 48.15),
        backleft    =   vector3(2414.97, 3097.45, 48.15),
        trunk       =   vector3(2417.23, 3096.36, 48.15),
        backright   =   vector3(2417.31, 3098.84, 48.15),
        frontright  =   vector3(2416.74, 3099.77, 48.15),
    },
    ["pos4"] = {
        hood        =   vector3(2408.82, 3096.69, 48.15),
        frontleft   =   vector3(2407.61, 3093.84, 48.15),
        backleft    =   vector3(2407.74, 3092.75, 48.15),
        trunk       =   vector3(2409.15, 3090.71, 48.15),
        backright   =   vector3(2410.38, 3092.93, 48.15),
        frontright  =   vector3(2410.3, 3094.02, 48.15),
    },
}

Config.ExtraTextPos = {
    ["pos1"] ={ 
        engine      =   vector3(2418.35, 3110.64, 48.15),   ---engine
        seat1       =   vector3(2421.58, 3110.1, 48.15),    --- seat1
        seat2       =   vector3(2420.63, 3112.72, 48.15),   --- seat2
        exaust      =   vector3(2424.3, 3112.69, 48.18),    --- exaust
    }, 
    ["pos2"] = {
        engine      =   vector3(2416.62, 3105.97, 48.15),
        seat1       =   vector3(2418.99, 3104.06, 48.15),
        seat2       =   vector3(2419.59, 3106.65, 48.15),
        exaust      =   vector3(2422.47, 3104.74, 48.15),
    },
    ["pos3"] = {
        engine      =   vector3(2414.25, 3101.44, 48.15),
        seat1       =   vector3(2414.43, 3098.39, 48.15),
        seat2       =   vector3(2416.74, 3099.77, 48.15),
        exaust      =   vector3(2417.23, 3096.36, 48.15),
    },
    ["pos4"] = {
        engine      =   vector3(2408.82, 3096.69, 48.15),
        seat1       =   vector3(2407.61, 3093.84, 48.15),
        seat2       =   vector3(2410.3, 3094.02, 48.15),
        exaust      =   vector3(2409.15, 3090.71, 48.15),
    },
}