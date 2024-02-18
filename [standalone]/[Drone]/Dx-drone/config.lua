Config = {
  Version = 1.00,             -- Notifies you of updates.

  UseESX = false,              -- Are you using ESX?
  BankAccountName = "bank",   -- ESX account name for bank.

  DroneSounds = true,        -- Should the drones make sound?

  MaxVelocity = 250.0,        -- Max drone speed (* drone stats.speed)
  BoostSpeed  = 3.0,          -- How much the boost ability multiplies max speed
  BoostAccel  = 2.0,          -- How much the boost ability multiplies acceleration
  BoostDrain  = 1.0,          -- Boost ability drain speed when used
  BoostFill   = 0.2,          -- Boost ability recharge speed.
  TazerFill   = 0.2,          -- Tazer ability recharge speed.

  InteractDist   = 3.0,       -- Inside shop distance for help text

  Shop = {   
    -- Blip stuff should all be self-explainatory.                
    show_blip   = false,
    blip_sprite = 627,
    blip_color  = 2,
    blip_scale  = 0.8,
    blip_text   = "Drone Shop",
    blip_disp   = 2,
    location    = vector4(-932.9287, -383.5694, 38.9613, 298.9182),

    displays = {
      [1] = {
        spawn_table = false,                                                                   -- spawn a table here aswell?
        drone_tier  = 1,                                                                      -- drone tier, related to Config.Drones table below.
        position    = vector4(127.48832702637,-3081.9638671875,4.9245405197144,0.0),          -- display location
        droneoffset = vector3(0.0,0.0,1.5),                                                   -- drone spawn offset
        camoffset2  = vector3(0.0,0.0,1.85),                                                  -- display camera offset 1
        camoffset1  = vector3(0.12,0.4,1.5),                                                  -- display camera offset 2
      },
    }
  },

  Drones = {
    [1] = {
      label = "Basic Flyer 1",                               -- Visible text.
      name = "drone_flyer_1",                                -- Item name.
      public = true,                                         -- Can be used by anybody?
      price = 1000,                                          -- Price
      model = GetHashKey('ch_prop_arcade_drone_01a'),        -- Model
      stats = {                        
        speed   = 1.0,               -- max speed multiplier
        agility = 1.0,               -- acceleration/deceleration multiplier
        range   = 100.0,             -- range (drone display begins fading out when leaving range)

        -- Max Stats:
        -- Max stats are displayed in the NUI window. You can categorize your drones by sharing max stats across similar drones (e.g: basic drone 1,2,3), and changing them for others (e.g: advanced drone 1,2,3).
        -- or you can choose to display the same max stats across all drones to have a fair comparison chart.
        maxSpeed    = 2,             
        maxAgility  = 2,
        maxRange    = 200,
      },
      abilities = {
        infared     = false,  -- infared/heat-vision
        nightvision = false,  -- nightvision
        boost       = false,  -- boost
        tazer       = false,  -- tazer 
        explosive   = false,  -- explosion
      },
      restrictions = {},          -- enter job names in here (e.g: {'police','mechanic'}) to restrict the drone purchase to these jobs only, or leave it empty (e.g: {}) for no job restrictions.
      bannerUrl = "banner1.png";  -- set the banner image to display at the shop while previewing this drone.
    },

    [2] = {
      label = "Basic Flyer 2",
      name = "drone_flyer_2",
      public = true,
      price = 1000,
      model = GetHashKey('ch_prop_arcade_drone_01b'),
      stats = {
        speed   = 0.5,
        agility = 1.5,
        range   = 100.0,

        maxSpeed    = 2,
        maxAgility  = 2,
        maxRange    = 200,
      },
      abilities = {
        infared     = false,
        nightvision = false,
        boost       = false,
        tazer       = false,
        explosive   = false,
      },
      restrictions = {},
      bannerUrl = "banner2.png";
    },

    [3] = {
      label = "Basic Flyer 3",
      name = "drone_flyer_3",
      public = true,
      price = 1000,
      model = GetHashKey('ch_prop_arcade_drone_01c'),
      stats = {
        speed   = 1.5,
        agility = 0.5,
        range   = 100.0,

        maxSpeed    = 2,
        maxAgility  = 2,
        maxRange    = 200,
      },
      abilities = {
        infared     = false,
        nightvision = false,
        boost       = false,
        tazer       = false,
        explosive   = false,
      },
      restrictions = {},
      bannerUrl = "banner3.png";
    },

    [4] = {
      label = "Advanced Flyer 1",
      name = "drone_flyer_4",
      public = true,
      price = 5000,
      model = GetHashKey('ch_prop_arcade_drone_01d'),
      stats = {
        speed   = 1.5,
        agility = 1.5,
        range   = 300.0,

        maxSpeed    = 2,
        maxAgility  = 2,
        maxRange    = 200,
      },
      abilities = {
        infared     = true,
        nightvision = true,
        boost       = true,
        tazer       = false,
        explosive   = false,
      },
      restrictions = {},
      bannerUrl = "banner4.png";
    },

    [5] = {
      label = "Advanced Flyer 2",
      name = "drone_flyer_5",
      public = true,
      price = 5000,
      model = GetHashKey('ch_prop_arcade_drone_01e'),
      stats = {
        speed   = 2.0,
        agility = 1.0,
        range   = 300.0,

        maxSpeed    = 2,
        maxAgility  = 2,
        maxRange    = 500,
      },
      abilities = {
        infared     = true,
        nightvision = true,
        boost       = true,
        tazer       = false,
        explosive   = false,
      },
      restrictions = {},
      bannerUrl = "banner3.png";
    },

    [6] = {
      label = "Advanced Flyer 3",
      name = "drone_flyer_6",
      public = true,
      price = 5000,
      model = GetHashKey('ch_prop_casino_drone_01a'),
      stats = {
        speed   = 1.0,
        agility = 2.0,
        range   = 300.0,

        maxSpeed    = 2,
        maxAgility  = 2,
        maxRange    = 500,
      },
      abilities = {
        infared     = true,
        nightvision = true,
        boost       = true,
        tazer       = false,
        explosive   = false,
      },
      restrictions = {},
      bannerUrl = "banner2.png";
    },

    [7] = {
      label = "Police Drone",
      name = "drone_flyer_7",
      public = false,
      price = 10000,
      model = GetHashKey('ch_prop_casino_drone_02a'),
      stats = {
        speed   = 1.0,
        agility = 1.0,
        range   = 500.0,

        maxSpeed    = 2,
        maxAgility  = 2,
        maxRange    = 500,
      },
      abilities = {
        infared     = true,
        nightvision = true,
        boost       = true,
        tazer       = true,
        explosive   = true,
      },
      restrictions = {
        'police','mechanic'
      },
      bannerUrl = "banner1.png";
    },
  },

  Controls = {
    Drone = {
      ["inspect"] = {
        codes = {38},
        text = "Inspect",
      },
      ["direction"] = {
        codes = {32,33,34,35},
        text = "Direction",
      },
      ["heading"] = {
        codes = {51,52},
        text = "Heading",
      },
      ["height"] = {
        codes = {21,22},
        text = "Height",
      },
      ["camera"] = {
        codes = {108,110,109,111},
        text = "Camera",
      },
      ["centercam"] = {
        codes = {214},
        text = "Center Camera",
      },
      ["zoom"] = {
        codes = {16,17},
        text = "Zoom"
      },
      ["nightvision"] = {
        codes = {140},
        text = "Nightvision"
      },
      ["infared"] = {
        codes = {75},
        text = "Infared"
      },
      ["tazer"] = {
        codes = {157},
        text = "Shock"
      },
      ["explosive"] = {
        codes = {158},
        text = "Explode"
      },
      ["boost"] = {
        codes = {160},
        text = "Boost"
      },
      ["home"] = {
        codes = {213},
        text = "Home",
      },
      ["disconnect"] = {
        codes = {200},
        text = "Disconnect"
      },
    },
    Homing = {
      ["cancel"] = {
        codes = {213},
        text = "Cancel",
      },
      ["disconnect"] = {
        codes = {200},
        text = "Disconnect"
      },
    }
  },
}

mLibs = exports["meta_libs"]

if Config.UseESX then
  TriggerEvent("esx:getSharedObject", function(obj) ESX = obj; end)
end