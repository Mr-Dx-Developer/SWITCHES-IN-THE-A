
Config = {}

Config.CommandName              = "pole"                -- The command name to be used, which will be followed by 1, 2  or 3 (eg. /pole1) | Default: "pole"
Config.CommandDescription       = "Pole Dance at VU"    -- The command description/hint/suggestion to show when typing it in chat | Default: "Pole Dance at VU"
Config.UseGabz                  = false                 -- Set true if using Gabz Vanilla Unicorn MLO, false for default GTA V mapping | Default: false
Config.LoopDances               = true                  -- When the animation for a dance finishes, loop to keep dancing | Default: true

Config.QBCoreScriptName         = "qb-core"             -- The name of the QBCore resource (Don't edit unless you changed the name of qb-core) | Default: "qb-core"
Config.ESXScriptName            = "es_extended"         -- The name of the ESX resource (Don't edit unless you changed the name of es_extended) | Default: "es_extended"
Config.OldESX                   = false                 -- If using the old esx:getSharedObject event, instead of the export function, make this true | Default: false

Config.DefaultPoles = {                                 -- Coordinates of the 3 VU poles that will be used with Config.UseGabz set to false
    vector3(356.5582275390625, -909.6923217773438, 31.5545654296875),
    vector3(354.18463134765625, -909.6659545898438, 31.5545654296875),
    vector3(-320.4263610839844,-1367.7493896484375,32.3297119140625),
    vector3(-320.29449462890625,-1377.4417724609375,32.3297119140625),  
    vector3(-325.6615295410156,-1385.5780029296875,32.076904296875)
  --  vector3(356.79559326171875, -914.0703125, 31.5545654296875),
  --  vector3(353.96044921875, -913.7538452148438, 31.6387939453125)
}

Config.GabzPoles = {                                    -- Coordinates of the 3 VU poles that will be used with Config.UseGabz set to true
vector3(356.5582275390625, -909.6923217773438, 31.5545654296875),
vector3(354.18463134765625, -909.6659545898438, 31.5545654296875),
vector3(356.79559326171875, -914.0703125, 31.5545654296875),
vector3(353.96044921875, -913.7538452148438, 31.6387939453125)
}
