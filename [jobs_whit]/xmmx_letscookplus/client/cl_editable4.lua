propObjects = {
    "prop_hobo_stove_01",
    "prop_bbq_1",
    "prop_micro_01",
    "prop_kitch_juicer",
    "prop_coffee_mac_02",
    "prop_griddle_01",
    "prop_foodprocess_01",
    "prop_toaster_02",
    "prop_copper_pan",
    "prop_ff_counter_03",
    "apa_mp_h_stn_chairarm_26",
    "prop_gazebo_03",
    "prop_still",
    "prop_printer_02",
    "prop_cooker_03"
} 

CreateThread(function() 
    local function addTargetModel(model, func)

        if Config.Target == "qb-target" or Config.Target == "qtarget" then

            exports[Config.Target]:AddTargetModel(model, {
                options = {
                    {
                        type        = 'client',
                        event       = func.event,
                        icon        = func.icon,
                        label       = func.label,
                        cookspot    = func.cookspot,
                        header      = func.header,
                    },
                },
                distance = Config.Distance,
            })

        elseif Config.Target == "ox_target" then 

            local options = { 
                { 
                    type        = 'client',
                    event       = func.event,
                    icon        = func.icon,
                    label       = func.label,
                    cookspot    = func.cookspot,
                    header      = func.header,
                    distance    = Config.Distance,  
                }, 
            } exports.ox_target:addModel(model, options)            
        end
    end
    
    addTargetModel(Config.Printers,     { event = 'xmmx_letscookplus:printer',              icon = "fa fa-print",           label = "Print Something",  }) -- Printers
    addTargetModel(Config.PartyboxProp, { event = 'xmmx_letscookplus:jukebox',              icon = 'fas fa-compact-disc',   label = 'Play Music',      }) -- Boombox     
    addTargetModel(Config.HoboStoves,   { event = 'xmmx_letscookplus:Cooking',              icon = "fas fa-utensils",       label = Locales[Config.Language].targetinfo["hobo"],            cookspot = Cooking.HoboStove,   header = Locales[Config.Language].menu["cook_hobo"],        }) -- Hobo Stove        
    addTargetModel(Config.Stoves,       { event = 'xmmx_letscookplus:Cooking',              icon = "fas fa-utensils",       label = Locales[Config.Language].targetinfo["stove"],           cookspot = Cooking.Stoves,      header = Locales[Config.Language].menu["cook_stove"],       }) -- Stoves
    addTargetModel(Config.Microwaves,   { event = 'xmmx_letscookplus:Cooking',              icon = "fas fa-utensils",       label = Locales[Config.Language].targetinfo["microwave"],       cookspot = Cooking.Microwaves,  header = Locales[Config.Language].menu["cook_microwaves"],  }) -- Microwaves
    addTargetModel(Config.Juicers,      { event = 'xmmx_letscookplus:Cooking',              icon = "fas fa-utensils",       label = Locales[Config.Language].targetinfo["juicer"],          cookspot = Cooking.Juicers,     header = Locales[Config.Language].menu["cook_juicers"],     }) -- Juicer
    addTargetModel(Config.Coffees,      { event = 'xmmx_letscookplus:Cooking',              icon = "fas fa-utensils",       label = Locales[Config.Language].targetinfo["coffee"],          cookspot = Cooking.Coffees,     header = Locales[Config.Language].menu["cook_coffees"],     }) -- Juicer
    addTargetModel(Config.Grills,       { event = 'xmmx_letscookplus:Cooking',              icon = "fas fa-utensils",       label = Locales[Config.Language].targetinfo["grill"],           cookspot = Cooking.Grills,      header = Locales[Config.Language].menu["cook_grills"],      }) -- BBQ Grills
    addTargetModel(Config.Toasters,     { event = 'xmmx_letscookplus:Cooking',              icon = "fas fa-utensils",       label = Locales[Config.Language].targetinfo["toaster"],         cookspot = Cooking.Toasters,    header = Locales[Config.Language].menu["cook_toasters"],    }) -- Toaster
    addTargetModel(Config.Fryers,       { event = 'xmmx_letscookplus:Cooking',              icon = "fas fa-utensils",       label = Locales[Config.Language].targetinfo["fryer"],           cookspot = Cooking.Fryers,      header = Locales[Config.Language].menu["cook_fryers"],      }) -- Copper Pot
    addTargetModel(Config.Griddles,     { event = 'xmmx_letscookplus:Cooking',              icon = "fas fa-utensils",       label = Locales[Config.Language].targetinfo["griddle"],         cookspot = Cooking.Griddles,    header = Locales[Config.Language].menu["cook_griddle"],     }) -- Griddle
    addTargetModel(Config.Processors,   { event = 'xmmx_letscookplus:Cooking',              icon = "fas fa-utensils",       label = Locales[Config.Language].targetinfo["processor"],       cookspot = Cooking.Processors,  header = Locales[Config.Language].menu["cook_processors"],  }) -- Food Processor
    addTargetModel(Config.Still,        { event = 'xmmx_letscookplus:Distilling',           icon = "fas fa-utensils",       label = Locales[Config.Language].targetinfo["shinestill"],      cookspot = Cooking.Moonshines,  header = Locales[Config.Language].menu["cook_still"],       }) -- Moonshine Still
    addTargetModel(propObjects,         { event = "xmmx_letscookplus:CheckPropData",        icon = "fas fa-hands",          label = Locales[Config.Language].targetinfo["pickup_prop"], })
    
    if Config.Target == "qb-target" or Config.Target == "qtarget" then 
        exports[Config.Target]:AddTargetModel(Config.PartyboxProp, {
            options = { 
                {  
                    icon = "fas fa-hands", 
                    label = Locales[Config.Language].targetinfo["pickup_prop"], 
                    action = function()                                
                        local pedCoords = GetEntityCoords(PlayerPedId())
                        local jukeBox = `sf_prop_sf_speaker_stand_01a`
                        local closestJukebox = GetClosestObjectOfType(pedCoords, 3.0, jukeBox, false)
                        local soundId = 'lc_'..closestJukebox
                        if closestJukebox then 
                            if exports.xsound:soundExists(soundId) then TriggerServerEvent("xmmx_letscookplus:soundStatus", "stop", soundId, {}) end
                            TriggerEvent("xmmx_letscookplus:radioRemoved", closestJukebox)
                            TriggerEvent("xmmx_letscookplus:CheckPropData")
                        end
                    end,
                }, 
            }, 
            distance = Config.Distance
        })
    elseif Config.Target == "ox_target" then 
        local options = { 
            { 
                icon = "fas fa-hands", 
                label = Locales[Config.Language].targetinfo["pickup_prop"], 
                onSelect = function()                                
                    local pedCoords = GetEntityCoords(PlayerPedId())
                    local jukeBox = `sf_prop_sf_speaker_stand_01a`
                    local closestJukebox = GetClosestObjectOfType(pedCoords, 3.0, jukeBox, false)
                    local soundId = 'lc_'..closestJukebox
                    if closestJukebox then 
                        if exports.xsound:soundExists(soundId) then
                            TriggerServerEvent("xmmx_letscookplus:soundStatus", "stop", soundId, {})
                        end
                        TriggerEvent("xmmx_letscookplus:radioRemoved", closestJukebox)
                        TriggerEvent("xmmx_letscookplus:CheckPropData")
                    end                    
                end,
            }, 
        } exports.ox_target:addModel(Config.PartyboxProp, options)
    end
end)