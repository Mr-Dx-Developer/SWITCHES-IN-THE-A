Config = {}
Config.Debug = true -- enable to add command /createbed [model]
Config.Variables = {
    Framework = 'QB', -- QB/ESX/None -- set to none to use k_sexm:forceStart trigger instead
    Notify = 'QB', -- QB/ESX/Custom -- custom function below
    ESXSharedObject = 'esx:getSharedObject', -- leave as is for qb(it wont be used)
    usingSQL = true, --Requires oxmysql and the sql to be imported
    DisableCommands = false, -- true = Disable /sex and /sleep commands (for development) see below
    --[[
        TriggerEvent('k_sexm:sexsetup') -- Setup sex scenes -- Example useage: Option on a radial menu 
        TriggerEvent('k_sexm:sleepsetup') -- Find and sleep in bed trigger -- Example useage: Option on a radial menu 
    ]]
    PregTestFemaleOnly = true, --set to false to enable anyone to use a preg test
    TimeTillBirth = 5760, -- In minutes, 60 = 1hr (time for pregnancies)
    NotifyPregnant = 10, -- In minutes, When should the player get notified that they need to head to hospital!
    UsingKDisease = true, -- set to true if you are using k_disease to get diseases to work!
    AllowTransmitted = {
        ["Chlamydia"] = {chance = 50, randomChance = 3}, -- chance = player transmission, randomChance = completely random chance for a player to get this sickness
        ["Gonorrhea"] = {chance = 50, randomChance = 3} ,-- chance = player transmission, randomChance = completely random chance for a player to get this sickness
        [ "Herpes"] = {chance = 50, randomChance = 3},-- chance = player transmission, randomChance = completely random chance for a player to get this sickness
    },
    MaleOnlyStart = true, -- set to false if you wan't females to be able to create sex placements (this won't algin correctly if false)
    BedModels = { -- you can try add more but support for bedmodels are limited, this will change in the future. (used for sleeping)
        `apa_mp_h_bed_with_table_02`,
        `apa_mp_h_bed_wide_05`,
        `apa_mp_h_bed_double_08`,
        `apa_mp_h_bed_double_09`,
        `apa_mp_h_yacht_bed_01`,
        `apa_mp_h_yacht_bed_02`,
    },
    DisableSex = false, -- true = Disable Sex and just be able to sleep
    PregnantChanceCreampie = 100, -- 85 = 85%, 100 = 100%, 50 = 50% 
    PregnantChanceRegular = 1, -- 85 = 85%, 100 = 100%, 50 = 50%
    PregnantChanceCondom = 1, -- 85 = 85%, 100 = 100%, 50 = 50%
    hospitalBeds = { -- you will most likely need to change these
        [1] = {coords= vector3(353.25, -584.73, 44.11-0.99), heading= 160.32},
        [2] = {coords= vector3(350.75, -591.95, 44.11-0.99), heading= 336.62}
    },
    RestoreClothing = true,
    DevelopBelly = true, -- enable/disable belly bump
    DevelopBellyTime = 30, -- at what time should the belly bump show
    BellyOutfit = {
        ['tshirt'] = {comp = 15, texture=0},-- Disable by setting it to = false
        ['torso'] = {comp = 68, texture=1},-- Disable by setting it to = false
        ['arms'] = {comp = 14, texture=0},-- Disable by setting it to = false
    },
    other = '', -- dev thing
    UsingNakedOutfit = true, -- set to false if you want players to get ready themselves.
    NakedOutfit = {
        ['male'] = {
            ['tshirt'] = {comp = 15, texture=0},-- Disable by setting it to = false
            ['pants'] = {comp = 21, texture=0},-- Disable by setting it to = false
            ['shoes'] = {comp = 34, texture=0},-- Disable by setting it to = false
            ['torso'] = {comp = 15, texture=0},-- Disable by setting it to = false
            ['arms'] = {comp = 15, texture=0},-- Disable by setting it to = false
        },

        ['female'] = {
            ['tshirt'] = {comp = 15, texture=0},-- Disable by setting it to = false
            ['pants'] = {comp = 17, texture=0},-- Disable by setting it to = false
            ['shoes'] = {comp = 35, texture=0},-- Disable by setting it to = false
            ['torso'] = {comp = 5, texture=0},-- Disable by setting it to = false
            ['arms'] = {comp = 15, texture=0},-- Disable by setting it to = false
        },
    },

    UsingSleepingOutfit = true, -- set to false if you want players to get ready themselves.
    SleepingOutfit = {
        ['male'] = {
            ['tshirt'] = {comp = 15, texture=0}, -- Disable by setting it to = false
            ['pants'] = {comp = 61, texture=0},-- Disable by setting it to = false
            ['shoes'] = {comp = 34, texture=0},-- Disable by setting it to = false
            ['torso'] = {comp = 5, texture=0},-- Disable by setting it to = false
            ['arms'] = {comp = 5, texture=0},-- Disable by setting it to = false
        },

        ['female'] = {
            ['tshirt'] = {comp = 15, texture=0},-- Disable by setting it to = false
            ['pants'] = {comp = 17, texture=1},-- Disable by setting it to = false
            ['shoes'] = {comp = 35, texture=0},-- Disable by setting it to = false
            ['torso'] = {comp = 16, texture=1},-- Disable by setting it to = false
            ['arms'] = {comp = 15, texture=0},-- Disable by setting it to = false
        },
    }

}


Config.Items = {
    'pregtest',
    'condom',
    'planb'
}

Config.Positions = {
    [1] = 'Blowjob',
    [2] = 'Doggystyle',
    [3] = 'Front Sex',
    [4] = 'Blowjob 2',
    [5] = 'Front Ontop',
}

Config.Controls = {
    ['invite'] = 38, -- Invite to sex [E]
    ['acceptinvite'] = 38, -- E -- Stop Sex
    ['denyinvite'] = 20, -- E -- take a guess lol
    ['sleep'] = 20, -- Sleep [Z]
    ['sleepright'] = 175, -- Sleep Right Arrow
    ['sleepleft'] = 174, -- Sleep Left Arrow
    ['sleepstop'] = 38, -- Sleep Left Arrow
    ['creampie'] = { -- combined
        21, --left shift
        20, --Z
    },
    ['switchright'] = 175, -- Switch Pos Right Arrow
    ['switchleft'] = 174, -- Switch Pos Left Arrow
    ['stopsex'] = 38, -- E -- Stop Sex
    ['squirt'] = 38, -- E -- take a guess lol
    ['remove'] = 20, -- Z remove scene

    ['getinandouthospitalbed'] = 20, -- Z -- get in hospitalbed

    ['headingfinish'] = 38, -- E finish heading
    ['headingleft'] = 174, -- Sleep Left Arrow
    ['headingright'] = 175, -- Sleep Left Arrow
    ['positionfinish'] = 38, -- E finish position
}


Config.Locales = {
    ['nearest'] = '[~g~E~w~] Have sex with nearest person!',
    ['havesex'] = 'Have Sex? [~g~E~w~] Yes | [~r~Z~w~] No',
    ['delete'] = '[~r~Z~w~] Remove Scene',
    ['sleep'] = '[~g~Z~w~] Sleep', 
    ['planb'] = 'You took a Plan B i hope it works.', 
    ['dontneed'] = 'You don\'t need this',
    ['waiting'] = '~r~Waiting for invite answer!',
    ['getout'] = '[E] Get out of bed',
    ['side'] =  '[~g~LEFT/RIGHT Arrow~w~] Pick a side',
    ['switch'] = '[~g~E~w~] Switch Position',
    ['select'] = '[~g~RIGHT/LEFT ARROW~w~] Select Position',
    ['currentpos'] = 'Current Position: ~y~',
    ['denied'] = 'They denied your invite.', 
    ['accepted'] = 'They accepted your invite!',
    ['stopsex'] = '[~r~Z~w~] Stop Sex',
    ['creampie'] = '[~r~Shift + Z~w~] Finish Creampie',
    ['squirt'] = '[~g~E~w~] Squirt',
    ['getinhospitalbed'] = '[Z] Get in hospital bed',
    ['getouthospitalbed'] = '[Z] Get Out hospital bed',
    ['usebed'] = '[~g~E~w~] Sleep in this bed',
    ['cancelsleep'] = '[~r~Z~w~] Cancel',
    ['takeoff'] = 'You took off your condom.',
    ['givingbirth'] = 'Giving birth to baby!',
    ['cannot'] = 'You cannot use this.',
    ['positive'] = 'The test came back positive!',
    ['negative'] = 'The test came back negative!',
    ['givebirth1'] = 'You are going to give birth in: ',
    ['min'] = ' Minutes!',
    ['sceneposition'] = 'Set your scene position [~g~E~w~]',
    ['sceneheading'] = 'Set your scene heading [~g~LEFT/RIGHT Arrow~w~]',
    ['headingfinish'] = 'Confirm [~g~E~w~]',
}

if not IsDuplicityVersion() then --Client Side
    function Notify(text, type)
        --custom code for a custom notify
    end

    function Progressbar(text, time) -- time in ms
        exports['progressBars']:startUI(time, text) -- https://github.com/KyroWasHere/progressBars feel free to change it to what ever
    end

    function onAlertPrego()
        if Config.Variables.UsingKDisease then
            exports['k_diseases']:CatchDisease('Dizzy', 100, true)
        end
        --When player is alerted about minutes till birth
        -- you can add some sound or something?
    end

    function onStopSleeping() 
        --custom code for when players get out of bed
        PutOnClothing()
    end

    function onGetPrego()

    end

    function onStopSex(mode)
        --mode 1 == male, mode 2 == female
        
        Wait(5000)
        PutOnClothing()
    end



    
    function onHaveBaby(gender)
        NotifyFramework('You had a baby '..gender..'!', 'success')
        --custom code when someone has a baby!
    end
end


function GetCore()
    if not IsDuplicityVersion() then -- Client side
        if Config.Variables.Framework == 'QB' then
            return exports['qb-core']:GetCoreObject()
        elseif Config.Variables.Framework == 'ESX' then
            local ESX = nil
            Citizen.CreateThread(function()
                while ESX == nil do
                    TriggerEvent(Config.Variables.ESXSharedObject, function(obj) return obj end)
                    Wait(0)
                end
            end)
        end

    else -- Server side
        print('^3Thanks for using my script :) Need assistance support at ^5discord.gg/y6RtPVwkXq ^7')
        if Config.Variables.Framework == 'QB' then
            return exports['qb-core']:GetCoreObject()
        elseif Config.Variables.Framework == 'ESX' then
            local ESX = nil
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
            return ESX
        end
    end
    return false
end
