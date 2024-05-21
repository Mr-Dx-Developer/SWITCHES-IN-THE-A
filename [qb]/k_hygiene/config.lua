Config = {}
Config.Variables = {
    Debug = false,
    Framework = 'QB', -- QB/ESX/None 
    Notify = 'QB', -- QB/ESX/Custom -- custom function below
    ESXSharedObject = 'esx:getSharedObject', -- leave as is for qb(it wont be used)
    CycleTime = 5000, -- in MS, 5000 = 5 secs (time between hygiene effects)
    Cooldown = 0.2, -- 1 = 1min
    DisableCommands = false, --If you disable commands you will need to supply a way to use these events
    usingTarget = true, -- You can edit the targets below in the config
    --[[
        TriggerEvent('k_hygiene:shitOnGround') -- Allows the player to shit where they stand
        TriggerEvent('k_hygiene:pee') -- Allows the player to piss where they stand
        TriggerEvent('k_hygiene:potty') -- Allows the use of the nearest porta potty
        TriggerEvent('k_hygiene:toilet') -- Allows the use of the nearest toilet 
        TriggerEvent('k_hygiene:bath') -- Allows the use of the nearest bath
    ]]
    Sounds = {
        enabled = true,
        farts = {
            'fart1',
            'fart2',
            'fart3',
            'fart4',
        },
        shits = {
            'shit1',
            'shit2'
        },
        shower = {
            'shower'
        },
        toilet = {
            'toiletflush'
        }
    },
    SearchForHygieneTime = 0.01,
    IterationsRate = 0.05, -- Rate of iterations default is 0.05=5sec
    toiletModels = {
        "prop_ld_toilet_01",
        "prop_toilet_01",
        "prop_toilet_02",
    },
    bathModels = {
        "apa_mp_h_bathtub_01",
        "v_res_mbath",
        "prop_birdbath2",
        "v_res_mbath",
        "prop_birdbath1",
    },
    UsingKDiseases = true, diseaseResourceName = 'k_diseases',
    ShowerBlips = {
        enabled = true,
        blipId = 120,
        blipColor = 0,
        blipSize = 0.3,
        blipName = 'Showers'
    },
    toiletLocations = { -- (You can also use a toilet prop)
        [1] = vector4(-803.21, 168.66, 76.74, 289.63),
        [2] = vector4(-753.75, 325.47, 199.49, 180.65),
    },
    ShowerLocations = { --If you have MLO's with bathrooms showers you can supply them here
        [1] = vector4(-1392.04, -1334.1, 4.15, 353.66),
        [2] = vector4(-1389.9, -1334.39, 4.15,  353.66),
        [3] = vector4(-1385.72, -1335.0, 4.15, 353.66),
        [4] = vector4(-1383.18, -1321.1, 4.15, 173.29),
        [5] = vector4(-1386.46, -1320.5, 4.15, 166.44),
        [6] = vector4(-1389.86, -1319.8, 4.15, 166.44),
        [7] = vector4(-1252.07, -1542.92, 4.3, 352.58),
        [8] = vector4(-1247.0, -1544.16, 4.3, 352.58),
        [9] = vector4(-1254.21, -1542.46, 4.3, 352.58),
        [10] = vector4(-1250.35, -1528.77, 4.3, 169.92),
        [11] = vector4(-1247.08, -1529.49, 4.3, 169.92),
        [12] = vector4(-1244.11, -1530.26, 4.3, 169.92)
    }
}


Config.HygieneStatus = {
    ['Dirty Hands'] = {
        hasThis = false, --Dont Touch
        canFade = false,
    },
    ['Dirty Face'] = {
        hasThis = false, --Dont Touch
        canFade = false,
    },
    ['Dirty Body'] = {
        hasThis = false, --Dont Touch
        canFade = false,
    },
    ['Sweaty'] = {
        hasThis = false, --Dont Touch
        canFade = { -- Once all iterations are done it removes the status set to false for it to never be remove automatically (would require the player to remove it themselves)
            iterations = 10 -- Each iteration is 5sec (IterationsRate)
        },
    },
    ['Smelly'] = {
        hasThis = false, --Dont Touch
        canFade = false,
    },
    ['Poop'] = {
        hasThis = false, --Dont Touch
        canFade = false,
        iterationsUntil = 300, -- Each iteration is 5sec (IterationsRate)
    },
    ['Pee'] = {
        hasThis = false, --Dont Touch
        canFade = false,
        iterationsUntil = 200, -- Each iteration is 5sec (IterationsRate)
    }
}


Config.Hygiene = {
    ['Dirty Hands'] = {
        catchVia = {
            ragdolling = true,
            swiming = false,
            sprinting = false,
        },
        getChance = 5,
        cleanBy = {
            swimming = true,
            bath = true,
            shower = true,
            toilet = false,
        },
        effects = {
            fliesAroundPlayer = false,
            wetBody = false,
            dirtyFace = false,
            dirtyArms = true,
            dirtyBody = false
        },
        cathNotify = 'Your hands are covered in dirt!',
        clearNotify = 'Your hands are no longer covered in dirt'
    },
    ['Dirty Face'] = {
        catchVia = {
            ragdolling = true,
            swiming = false,
            sprinting = false,
        },
        getChance = 5,
        cleanBy = {
            swimming = true,
            bath = true,
            shower = true,
            toilet = false,
        },
        effects = {
            fliesAroundPlayer = false,
            wetBody = false,
            dirtyFace = true,
            dirtyArms = false,
            dirtyBody = false
        },
        cathNotify = 'Your face is covered in dirt!',
        clearNotify = 'Your face is no longer covered in dirt'
    },

    ['Dirty Body'] = {
        catchVia = {
            ragdolling = true,
            swiming = false,
            sprinting = false,
        },
        getChance = 5,
        cleanBy = {
            swimming = true,
            bath = true,
            shower = true,
            toilet = false,
        },
        effects = {
            fliesAroundPlayer = true,
            wetBody = false,
            dirtyFace = false,
            dirtyArms = false,
            dirtyBody = true
        },
        cathNotify = 'Your body is covered in dirt!',
        clearNotify = 'Your body is no longer covered in dirt'
    },

    ['Sweaty'] = {
        catchVia = {
            ragdolling = false,
            swiming = false,
            sprinting = true,
        },
        getChance = 5,
        cleanBy = {
            swimming = true,
            bath = true,
            shower = true,
            toilet = false,
        },
        effects = {
            fliesAroundPlayer = false,
            wetBody = true,
            dirtyFace = false,
            dirtyArms = false,
            dirtyBody = false
        },
        cathNotify = 'You are sweating...',
        clearNotify = 'You are no longer sweaty'
    },

    ['Smelly'] = {
        catchVia = {
            ragdolling = false,
            swiming = false,
            sprinting = false,
        },
        getChance = 5,
        cleanBy = {
            swimming = true,
            bath = true,
            shower = true,
            toilet = false,
        },
        effects = {
            fliesAroundPlayer = true,
            wetBody = false,
            dirtyFace = false,
            dirtyArms = false,
            dirtyBody = false
        },
        cathNotify = 'You stink...',
        clearNotify = 'You no longer stink'
    },

    ['Poop'] = {
        catchVia = {
            ragdolling = false,
            swiming = false,
            sprinting = false,
        },
        getChance = 100,
        cleanBy = {
            swimming = false,
            bath = false,
            shower = false,
            toilet = true,
        },
        effects = {
            fliesAroundPlayer = false,
            wetBody = false,
            dirtyFace = false,
            dirtyArms = false,
            dirtyBody = false
        },
        notifactions = {
            [300] = "Your stomach rumbles...",
            [200] = "You feel like you need to poo soon...",
            [100] = "You really need to poo...",
            [50] = "You're turtle heading...",
            [10] = "You begin to feel poo begin to slip out..."
        },
        clearNotify = 'You empty yourself you no longer need to poop',
        cantDo = "You don't need to poo"
    },
    ['Pee'] = {
        catchVia = {
            ragdolling = false,
            swiming = false,
            sprinting = false,
        },
        getChance = 100,
        cleanBy = {
            swimming = false,
            bath = false,
            shower = false,
            toilet = true,
        },
        effects = {
            fliesAroundPlayer = false,
            wetBody = false,
            dirtyFace = false,
            dirtyArms = false,
            dirtyBody = false
        },
        notifactions = {
            [200] = "You feel like you need to piss soon...",
            [100] = "Your bladder is screaming at you...",
            [50] = "You're about to piss yourself!",
        },
        clearNotify = 'You take a piss',
        cantDo = "You don't need to pee"
    }
}




Config.InteractionConfig = {
    ['shower'] = {
        keybind = 38,
        text = '[E] Use Shower'
    }
}



if not IsDuplicityVersion() then --Client Side

    if Config.Variables.usingTarget then
        exports['qb-target']:AddTargetModel(Config.Variables.toiletModels, { 
        options = { 
          { 
            num = 1, 
            type = "client", 
            icon = 'fas fa-toilet',
            label = 'Use', 
            action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
              TriggerEvent('k_hygiene:toilet')
            end,
          }
        },
        distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
      })
      exports['qb-target']:AddTargetModel(Config.Variables.bathModels, { 
        options = { 
          { 
            num = 1, 
            type = "client", 
            icon = 'fas fa-bath',
            label = 'Use', 
            action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
              TriggerEvent('k_hygiene:bath')
            end,
          }
        },
        distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
      })

      exports['qb-target']:AddTargetModel({'prop_portaloo_01a'}, { 
        options = { 
          { 
            num = 1, 
            type = "client", 
            icon = 'fas fa-toilet',
            label = 'Use', 
            action = function(entity) -- This is the action it has to perform, this REPLACES the event and this is OPTIONAL
              TriggerEvent('k_hygiene:potty')
            end,
          }
        },
        distance = 2.5, -- This is the distance for you to be at for the target to turn blue, this is in GTA units and has to be a float value
      })
    end
    


    function Notify(text, type)
        print(text)


        --custom code for a custom notify
    end

    function OnIterationTick()
        --Each tick for iterations (incase you want to tiem it out for a period or something)
    end

    function OnIteration(type)
        Hygienes = exports[GetCurrentResourceName()]:GetHygiene()
        --Each iteration of type
    end

    --[[ K_DISEASE Implementation and Hygiene evolve! ]]
    local sweatAmount = 0
    local sickFromSmelly = 0
    local sickFromDirtyHands = 0

    function OnEffect(type) -- Fires at the same time as effects
        --print(type)

        Hygienes = exports[GetCurrentResourceName()]:GetHygiene()
        if type == 'Sweaty' then
            if GetPlayerStamina(PlayerId()) < 20.0 then -- If the player has been sweaty 5 times and is continuing to sprint constantly they will be smelly with a 25% chance
                sweatAmount = sweatAmount +1 
                debugPrint('smelly'..sweatAmount)
                if sweatAmount == 10 then
                    exports[GetCurrentResourceName()]:CatchHygiene('Smelly', 10, true)
                    sweatAmount = 0
                end
            end
        end

        if Config.Variables.UsingKDiseases then
            if type == 'Smelly' then
                sickFromSmelly = sickFromSmelly +1
                if sickFromSmelly == 5 then
                    exports[Config.Variables.diseaseResourceName]:CatchDisease('Bad Stomach', 5, true)
                    exports[Config.Variables.diseaseResourceName]:CatchDisease('Diarrhea', 5, true)
                    sickFromSmelly = 0
                end
            end

            if type == 'Dirty Hands' then
                sickFromDirtyHands = sickFromDirtyHands +1 
                if sickFromDirtyHands == 10 then
                    exports[Config.Variables.diseaseResourceName]:CatchDisease('Bad Stomach', 1, true)
                    exports[Config.Variables.diseaseResourceName]:CatchDisease('Diarrhea', 1, true)
                    exports[Config.Variables.diseaseResourceName]:CatchDisease('Dizzy', 1, true)
                    sickFromDirtyHands = 0
                end
            end
        end
    end

    local poopRandom = 0
    local peeRandom = 0
    function OnEffectTick()
        Hygienes = exports[GetCurrentResourceName()]:GetHygiene()
        debugPrint(json.encode(Hygienes))
        debugPrint('Pee/Poo Random Count^5 '..peeRandom..' '..poopRandom)
        if Hygienes then
            if not Hygienes['Poop'].hasThis then
                poopRandom = poopRandom + 1 
        
                if poopRandom == 600 then
                    poopRandom = 0
                    exports[GetCurrentResourceName()]:CatchHygiene('Poop', 100, true)
                    Wait(1000)
                end
            end

            if not Hygienes['Pee'].hasThis then
                peeRandom = peeRandom + 1 
    
                if peeRandom == 400 then
                    peeRandom = 0
                    exports[GetCurrentResourceName()]:CatchHygiene('Pee', 100, true)
                    Wait(1000)
                end
            end
        end

    end
    local canDoAnim = true
    function CanPedDoAnim(toggle) -- when using this export you must always set it back to true after setting it to false.
        if canDoAnim then
            if K.CheckDead() then
                return false
            end
        end
        if toggle ~= nil then
            canDoAnim = toggle
        end
        return canDoAnim
    end
    exports('CanPedDoAnim', CanPedDoAnim)

    function OnShowerFinish()
        
    end
    function OnBathFinish()
        
    end
    function OnPee()
        debugPrint('peeing')
    end
    function OnPooOnGround()
        debugPrint('pooing')
    end

else
    function getStandaloneIden(src)
        local license  = false
    
        for k,v in pairs(GetPlayerIdentifiers(src))do
        
            if string.sub(v, 1, string.len("license:")) == "license:" then
                license = v
                return v
            end
        end
        return false
    end
    
    
    function DropExploiter(src)
        DropPlayer(src, 'stinky cheetor')
    end
end


function GetCore()
    if not IsDuplicityVersion() then -- Client side
        if Config.Variables.Framework == 'QB' then
            return exports['qb-core']:GetCoreObject()
        elseif Config.Variables.Framework == 'ESX' then
            if ESX == nil then
                local ESX = nil
                Citizen.CreateThread(function()
                    while ESX == nil do
                        TriggerEvent(Config.Variables.ESXSharedObject, function(obj) return obj end)
                        Wait(0)
                    end
                end)
            end
        end

    else -- Server side
        print('^3Thanks for using my script :) Need assistance support at ^5discord.gg/y6RtPVwkXq ^7')
        if Config.Variables.Framework == 'QB' then
            return exports['qb-core']:GetCoreObject()
        elseif Config.Variables.Framework == 'ESX' then
            if ESX == nil then
                local ESX = nil
                TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
                return ESX
            end
        end
    end
    return false
end
