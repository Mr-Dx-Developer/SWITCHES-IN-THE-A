Configuration = {

    framework = 'qbcore',  -- framework "esx" or "qbcore"

    trigger = 'qb-core', -- qb-core or es_extended

    Mysql = 'oxmysql',  -- oxmysql, mysql-async or ghmattisql

    UseKeys = false,
    UseFuel = false,
    UseDeleteVehicle = false,
    UseWorkUniforms = true,
    UseQuasarInventory = false,
    
    NPC = {
        {x = -542.96, y = -207.84, z = 37.64, h = 219.12, ped},
        -- {x = 1533.12, y = -2116.28, z = 76.8, h = 219.12, ped}
    },

    NPCmodel = "cs_barry",

    Payment_type = "cash", --bank or cash

    vehicleData = {
        [`rebel`] = {0, -2.0, -0.3},
        [`mule`] = {0, -2.0, 0},
        [`model3`] = {0, -2.0, 0},
    },

    Color_UI = "#9B37FF",

}

Target = {
    UseTarget = false, 

    Coords = vector3(-542.96, -207.84, 37.64),

    TargetExport = 'qb-target',

    ["Home"] = {
        Text = 'WORK CENTRE', 
        Icon = 'fa fa-briefcase'        
    },

    ["Workclothes"] = {
        [1] = {
            Text = 'START WORK', 
            Icon = 'fa fa-user-circle-o' 
        },
        [2] = {
            Text = 'REMOVE JOB', 
            Icon = 'fa fa-sign-out' 
        }
    },

    ["Vehicle"] = {
        [1] = {
            Text = 'TAKE VEHICLE', 
            Icon = 'fa fa-car' 
        },
        [2] = {
            Text = 'SAVE VEHICLE', 
            Icon = 'fa fa-car' 
        }
    },

    ["Tool"] = {
        [1] = {
            Text = 'TAKE TOOL', 
            Icon = 'fa fa-wrench' 
        },
        [2] = {
            Text = 'SAVE TOOL', 
            Icon = 'fa fa-wrench' 
        }
    },

    ["Job"] = {
        Text = 'WORK', 
        Icon = 'fa fa-hand-rock-o' 
    },

    ["Payout"] = {
        Text = 'COLLECT PAYMENT', 
        Icon = 'fa fa-money' 
    }

}