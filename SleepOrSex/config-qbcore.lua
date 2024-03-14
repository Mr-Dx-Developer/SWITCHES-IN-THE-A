Config = {}
local second = 1
local minute = 60 * second
local hour = 60 * minute
local day = 24 * hour
local week = 7 * day
local month = 4 * week

Config.Debug = false -- this will print everything on client/server
Config.PrintTableSleep = 'printsleepanimation' -- only if Config.Debug = true
Config.PrintTableSex = 'printsexanimation' -- only if Config.Debug = true
Config.AddPregnantCommand = 'addpregnant' -- only if Config.Debug is true 
Config.RemovePregnantCommand = 'removepregnant' -- only if Config.Debug is true 
Config.SelectPartnerSexCommand = 'partnersex' -- For set what sleep did you want to use

--Framework
Config.QBCore = true
Config.TriggerEventQBCore = 'qb-core' -- Default one
Config.TriggerEventPlayerSpawn = 'QBCore:Client:OnPlayerLoaded' -- esx:onPlayerSpawn (newest esx) / playerSpawned (old shit esx)

--Command
Config.SetSleepCommand = 'sleepanimation' -- For set what sleep did you want to use
Config.SetSexCommand = 'sexanimation' -- For set what sex did you want to use
Config.TableSexCommand = 'tablesexanimation' -- For see tables sex, and reset the animation

--Target
Config.NameTarget = 'qtarget' -- false this if you didnt use any target // if you using ox_target, keep it the value qtarget
Config.IconSleep = 'fas fa car' -- icon for sleep
Config.IconSex = 'fas fa car' -- icon for sex

--Pregnant & SleepOrSex Part
Config.BlurDuringSex = false -- hmm, fivem policy?
Config.DistanceBed = 3.0 -- Dont run over 10.0
Config.SkinChanger = false --Did you use Skin Changer and esx_skin? // false if you using fivem-appearance or using QBCore
Config.Pajama = true -- true/false using and removes pajama before/after sleep
Config.Health = false -- true/false for add health after sleep
Config.AmountHealth = 200 -- 0-200 add amount for health after sleep
Config.Armor = false -- true/false for add armor after sleep
Config.AmountArmor = 100 -- 0-100 add amount for armor after sleep
Config.DecreaseHungerAndThirst = false -- true/false for decrease hunger and thrist after sleep // scrolldown for the function
Config.DecreaseStressSleep = false -- true/false for decrease stress after sleep // scrolldown for the function
Config.Sleep = 20000 --Time of sleep (miliseconds)
Config.TriggerSleep = 38 -- E (control fivem) // Dont forget to change Strings Transalate
Config.TriggerSex = 38 -- E (control fivem) // Dont forget to change Strings Transalate
Config.TriggerSquirt = 38 -- E (control fivem) // Dont forget to change Strings Transalate
Config.AcceptEmote = 246 -- Y (control fivem) // Dont forget to change Strings Transalate
Config.DeclineEmote = 182 -- L (control fivem) // Dont forget to change Strings Transalate
--Pregnant Part
Config.Clothes = true -- true/false using and removes clothes before/after sex
Config.AllowPregnant = true -- true/false if you want allow pregnant after sex // notes: config.clothes must be true for allow pregnant!
Config.MaxChancePregnant = 100 -- (100%) Max Pregnant Chance after having sex
Config.ChancePregnant = 10 -- Random from 1 to Config.MaxChancePregnant, so for example it'll 10%
Config.CumDifficulty = {'easy', 'easy', 'medium'} -- Difficulty for player to make the female pregnant // if someone failed then Chance Pregnant will Triggered
Config.SexHealth = false -- true/false for add health after sex
Config.SexAmountHealth = 200 -- 0-200 add amount for health after sex
Config.SexArmor = false -- true/false for add armor after sex
Config.SexAmountArmor = 100 -- 0-100 add amount for armor after sex
Config.DecreaseHungerAndThirstAfterSex = false -- true/false for decrease hunger and thrist after sex // scrolldown for the function
Config.DecreaseStressSex = false -- true/false for decrease stress after sex // scrolldown for the function
Config.FadeOutInDuration = 5000 -- ms, duration per scene
Config.SexDuration = 5000 -- ms, duration per scene
Config.DictMaleAnimationSexFixZ = sexmaledict == 'xxx' or sexmaledict == 'xxx' -- some example for fix animation needs z reduction (for addon sex animation?)
Config.DictFemaleAnimationSexFixZ = sexfemaledict == 'xxx' or sexfemaledict == 'xxx' -- some example for fix animation needs z reduction (for addon sex animation?)
Config.ItemViagra = 'viagra' -- if have value then /sexeverywhere but using item // if you want using command make this false
Config.SexDurationViagra = 2000 -- ms, Config.SexDuration + Config.SexDurationViagra
Config.CommandSexEverywhere = 'sexeverywhere' -- command for sexeverywhere, dont false this or error will appear on client!
Config.TimePregnant = 3 * day --How long until u get big pregnant? example u want add 10 days (10 * days) or (week + 3 * day)
Config.TxAdmin = true -- True if you using txadmin, this is for saving and update all pregnant database before restart // if false then it will save and update every 1 hour
Config.ComdomDuration = 20000 -- ms
Config.LevonorgestrelDuration = 20000 -- ms
Config.AbortionDuration = 20000 -- ms
Config.AnimationStumblePregnant = true
Config.AnimMillSecPregnant = math.random(100000, 500000) --Time of Animation will active randomly while positive (miliseconds)

--Child Birth
Config.DeathAfterChildBirth = true
Config.MaxChanceDeath = 100 -- (100%) Max Pregnant Chance after having sex
Config.ChanceDeath = 10 -- Random from 1 to Config.MaxChancePregnant, so for example it'll 10%
Config.LocationChildBirth = vector3(308.76, -571.72, 48.2) -- location for child birth
Config.IconChildBirth = 'fas fa car' -- icon for child birth
Config.HeadingChildBirth = 161.96 -- heading for child birth
Config.ChildBirthDuration = 20000 -- ms

--Shower
Config.EnableShower = true -- enable /shower?
Config.CommandShower = 'shower' -- command for shower
Config.AddHealthAfterShower = false -- add health after shower?
Config.ValueHealthAfterShower = 10 -- value health
Config.AddArmorAfterShower = false -- add armor after shower?
Config.ValueArmorAfterShower = 10 -- value armor

--Disease
Config.Disease = true -- enable disease?
Config.MaxChanceHIV = 100
Config.ChanceHIV = 1 -- Random from 1 to Config.MaxChanceHIV, so for example it'll 1%
Config.MaxChanceHepatitis = 100
Config.ChanceHepatitis = 5 -- Random from 1 to Config.MaxChanceHepatitis, so for example it'll 5%
Config.MaxChanceGonore = 100
Config.ChanceGonore = 80 -- Random from 1 to Config.MaxChanceGonore, so for example it'll 80%
Config.MaxChanceKlamidia = 100
Config.ChanceKlamidia = 60 -- Random from 1 to Config.MaxChanceKlamidia, so for example it'll 60%
Config.AdminRanks = {
    'superadmin',
    'admin',
}

Config.Bed = { --What props bed did you want to use to sleep? (example add more bed, `hash_name`) // dont forget add , at the end for adding more bed
    `v_res_msonbed_s`,
    `p_lestersbed_s`,
    `p_mbbed_s`,
    `p_v_res_tt_bed_s`,
    `v_res_msonbed_s`,
    `v_res_mbbed`,
    `v_res_d_bed`,
    `v_res_tre_bed1`,
    `v_res_tre_bed2`,
    `v_res_tt_bed`,
    `apa_mp_h_bed_double_09`,
    `apa_mp_h_yacht_bed_02`,
    `apa_mp_h_bed_double_08`,
    `apa_mp_h_bed_with_table_02`,
    -- new bed
    `v_16_bdr_mesh_bed`,
    `v_16_mid_bed_bed`,
    `v_24_bdr_mesh_bed`,
    `v_61_bd2_mesh_bed`,
    `v_8_bedrm4stuff`,
    `v_8_bed3stuff`,
    `apa_mp_h_bed_wide_05`,
    `apa_mp_h_yacht_bed_01`,
    `gr_prop_bunker_bed_01`,
    `hei_heist_bed_double_08`,
    `imp_prop_impexp_sofabed_01a`,
    `sum_mp_h_yacht_bed_01`,
    `sum_mp_h_yacht_bed_02`,
    `v_49_motelmp_bed`,
    `apa_mp_h_01_bed`,
    `mp_b_bed_double_08`,
    `apa_mpa2_bedwide_06`,
    `apa_mp_h_04_bed`,
    `apa_mp_h_05_bed`,
    `apa_mpa6_bedwide_06`,
    `apa_mp_h_08_bed`,
    `xs_x18intmod_high_end_bed`,
    `xs_x18intmod_ind_bed`,
    `xs_x18intmod_standard_bed`,
    `hei_int_heist_bdr_bed`,
    `h4_int_sub_bed`,
    `h4_mp_h_yacht_bed_01`,
    `h4_mp_h_yacht_bed_02`,
    `sf_int1_bdr_bed`,
    `sf_mp_h_yacht_bed_01`,
    `sf_mp_h_yacht_bed_02`,
    `sm_charlie_bed`,
    `sm_hanger_bed_modern_bed`,
    `sm_hanger_bedroom_tradbed`,
    `tr_int1_campbed`,
}

Config.AnimationSleep = {
    [1] = {
        label = 'Sleep 1',
        description = 'This is Decription',
        dict = 'timetable@tracy@sleep@',
        name = 'idle_c',
    },
    [2] = {
        label = 'Sleep 2',
        description = 'This is Decription',
        dict = 'anim@amb@nightclub@lazlow@lo_sofa@',
        name = 'lowsofa_base_laz',
    },
    [3] = {
        label = 'Sleep 3',
        description = 'This is Decription',
        dict = 'anim@amb@nightclub@lazlow@lo_sofa@',
        name = 'lowsofa_dlg_crying_laz',
    },
    [4] = {
        label = 'Sleep 4',
        description = 'This is Decription',
        dict = 'anim@amb@nightclub@lazlow@lo_sofa@',
        name = 'lowsofa_dlg_fuckedup_laz',
    },
    [5] = {
        label = 'Sleep 5',
        description = 'This is Decription',
        dict = 'anim@amb@nightclub@lazlow@lo_sofa@',
        name = 'lowsofa_dlg_notagain_laz',
    },
    [6] = {
        label = 'Sleep 6',
        description = 'This is Decription',
        dict = 'anim@amb@nightclub@lazlow@lo_sofa@',
        name = 'lowsofa_dlg_shit2strong_laz',
    },
}

Config.PajamaOutfit = { --Pajama Outfit (esx_skin and skinchanger)
	male = {
        tshirt_1 = 15,  tshirt_2 = 0,
        torso_1 = 144,   torso_2 = 0,
        decals_1 = 0,   decals_2 = 0,
        arms = 6,
        pants_1 = 65,   pants_2 = 0,
        shoes_1 = 34,   shoes_2 = 0,
        helmet_1 = -1,  helmet_2 = 0,
        chain_1 = 0,    chain_2 = 0,
        glasses_1 = 0,     glasses_2 = 0
    },

	female = {
        tshirt_1 = 6,  tshirt_2 = 0,
        torso_1 = 142,   torso_2 = 0,
        decals_1 = 0,   decals_2 = 0,
        arms = 6,
        pants_1 = 67,   pants_2 = 0,
        shoes_1 = 35,   shoes_2 = 0,
        helmet_1 = -1,  helmet_2 = 0,
        chain_1 = 0,    chain_2 = 0,
        glasses_1 = 5,     glasses_2 = 0
    }
}

Config.NakedOutfit = { --Naked Outfit (esx_skin and skinchanger)
	male = {
        tshirt_1 = 15,  tshirt_2 = 0,
        torso_1 = 15,   torso_2 = 0,
        decals_1 = 0,   decals_2 = 0,
        arms = 15,
        pants_1 = 61,   pants_2 = 0,
        shoes_1 = 34,   shoes_2 = 0,
        helmet_1 = -1,  helmet_2 = 0,
        chain_1 = 0,    chain_2 = 0,
        glasses_1 = 0,     glasses_2 = 0
    },

	female = {
        tshirt_1 = 15,  tshirt_2 = 0,
        torso_1 = 15,   torso_2 = 0,
        decals_1 = 0,   decals_2 = 0,
        arms = 15,
        pants_1 = 15,   pants_2 = 0,
        shoes_1 = 35,   shoes_2 = 0,
        helmet_1 = -1,  helmet_2 = 0,
        chain_1 = 0,    chain_2 = 0,
        glasses_1 = 5,     glasses_2 = 0
    }
}

Config.PregnantOutfit = { --Pregnant Outfit (esx_skin and skinchanger)
	female = {
        tshirt_1 = 15,  tshirt_2 = 0,
        torso_1 = 68,   torso_2 = 0,
        decals_1 = 0,   decals_2 = 0,
        arms = 0,
        pants_1 = 12,   pants_2 = 0,
        shoes_1 = 16,   shoes_2 = 1,
        helmet_1 = -1,  helmet_2 = 0,
        chain_1 = 0,    chain_2 = 0,
        glasses_1 = 5,     glasses_2 = 0
    }
}

function StandaloneFemalePregnantPeds()
	SetPedComponentVariation(PlayerPedId(), 3, 7, 0, 0)--arms
	SetPedComponentVariation(PlayerPedId(), 4, 60, 1, 0)--pants
	SetPedComponentVariation(PlayerPedId(), 6, 16, 0, 0)--shoes
	SetPedComponentVariation(PlayerPedId(), 11, 109, 1, 0)--torso
	SetPedComponentVariation(PlayerPedId(), 8, 14, 0, 0)--tshirt
end

function StandaloneFemalePeds()
	SetPedComponentVariation(PlayerPedId(), 3, 7, 0, 0)--arms
	SetPedComponentVariation(PlayerPedId(), 4, 60, 1, 0)--pants
	SetPedComponentVariation(PlayerPedId(), 6, 16, 0, 0)--shoes
	SetPedComponentVariation(PlayerPedId(), 11, 109, 1, 0)--torso
	SetPedComponentVariation(PlayerPedId(), 8, 14, 0, 0)--tshirt
end

function StandaloneMalePeds()
	SetPedComponentVariation(PlayerPedId(), 3, 6, 0, 0)--arms
	SetPedComponentVariation(PlayerPedId(), 4, 58, 1, 0)--pants
	SetPedComponentVariation(PlayerPedId(), 6, 5, 2, 0)--shoes
	SetPedComponentVariation(PlayerPedId(), 11, 117, 1, 0)--torso
	SetPedComponentVariation(PlayerPedId(), 8, 15, 0, 0)--tshirt
end

function StandaloneNakedFemalePeds()
	SetPedComponentVariation(PlayerPedId(), 3, 15, 0, 0)--arms
	SetPedComponentVariation(PlayerPedId(), 4, 15, 0, 0)--pants
	SetPedComponentVariation(PlayerPedId(), 6, 35, 0, 0)--shoes
	SetPedComponentVariation(PlayerPedId(), 11, 15, 1, 0)--torso
	SetPedComponentVariation(PlayerPedId(), 8, 15, 0, 0)--tshirt
end

function StandaloneNakedMalePeds()
	SetPedComponentVariation(PlayerPedId(), 3, 15, 0, 0)--arms
	SetPedComponentVariation(PlayerPedId(), 4, 61, 0, 0)--pants
	SetPedComponentVariation(PlayerPedId(), 6, 34, 2, 0)--shoes
	SetPedComponentVariation(PlayerPedId(), 11, 15, 1, 0)--torso
	SetPedComponentVariation(PlayerPedId(), 8, 15, 0, 0)--tshirt
end

function ResetMalePeds() -- idk how to put back clothes standalone version
	--ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
	--	TriggerEvent('skinchanger:loadSkin', skin)
	--end)
    ExecuteCommand('reloadchar')
end

function ResetFemalePeds() -- idk how to put back clothes standalone version
	--ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
	--	TriggerEvent('skinchanger:loadSkin', skin)
	--end)
    ExecuteCommand('reloadchar')
end

Config.AnimationSex = {
    [1] = {
        label = 'Sex 1',
        description = 'This is Decription',
        maledict = 'misscarsteal2pimpsex',
        malename = 'pimpsex_punter',
        femaledict = 'misscarsteal2pimpsex',
        femalename = 'pimpsex_hooker',
        bone = 9816,
        x = 0.0,
        y = 0.60,
        z = 0.0,
        xrot = 120.0,
        yrot = 0.0,
        zrot = 180.0,
    },
    [2] = {
        label = 'Sex 2',
        description = 'This is Decription',
        maledict = 'misscarsteal2pimpsex',
        malename = 'shagloop_pimp',
        femaledict = 'misscarsteal2pimpsex',
        femalename = 'shagloop_hooker',
        bone = 9816,
        x = 0.05,
        y = 0.35,
        z = 0.1,
        xrot = 120.0,
        yrot = 0.0,
        zrot = 180.0,
    },
    [3] = {
        label = 'Sex 3',
        description = 'This is Decription',
        maledict = 'rcmpaparazzo_2',
        malename = 'shag_loop_a',
        femaledict = 'rcmpaparazzo_2',
        femalename = 'shag_loop_poppy',
        bone = 9816,
        x = 0.015,
        y = -0.25,
        z = 0.0,
        xrot = 0.9,
        yrot = 0.3,
        zrot = 0.0,
    },
    [4] = {
        label = 'Sex 4',
        description = 'This is Decription',
        maledict = 'oddjobs@towing',
        malename = 'm_blow_job_loop',
        femaledict = 'oddjobs@towing',
        femalename = 'f_blow_job_loop',
        bone = 9816,
        x = -0.8,
        y = 0.1,
        z = 0.0,
        xrot = 0.0,
        yrot = 0.3,
        zrot = 0.0,
    },
    [5] = {
        label = 'Sex 5',
        description = 'This is Decription',
        maledict = 'mini@prostitutes@sexlow_veh',
        malename = 'low_car_sex_loop_player',
        femaledict = 'mini@prostitutes@sexlow_veh',
        femalename = 'low_car_sex_loop_female',
        bone = 9816,
        x = -0.8,
        y = 0.0,
        z = 0.0,
        xrot = 0.0,
        yrot = -0.3,
        zrot = 0.0,
    },
    [6] = {
        label = 'Sex 6',
        description = 'This is Decription',
        maledict = 'oddjobs@assassinate@vice@sex',
        malename = 'frontseat_carsex_loop_m',
        femaledict = 'oddjobs@assassinate@vice@sex',
        femalename = 'frontseat_carsex_loop_f',
        bone = 9816,
        x = -0.8,
        y = 0.1,
        z = 0.0,
        xrot = 0.0,
        yrot = 0.3,
        zrot = 0.0,
    },
    [7] = {
        label = 'Sex 7',
        description = 'This is Decription',
        maledict = 'random@drunk_driver_2',
        malename = 'cardrunksex_loop_m',
        femaledict = 'random@drunk_driver_2',
        femalename = 'cardrunksex_loop_f',
        bone = 9816,
        x = 0.7,
        y = 0.0,
        z = 0.01,
        xrot = 0.0,
        yrot = 0.3,
        zrot = 0.0,
    },
}

Strings = {
    ['havesex'] = 'Press ~INPUT_CONTEXT~ for sex with her/him',
    ['sleep'] = 'Press ~INPUT_CONTEXT~ for sleep',
    ['wakeup'] = 'You wake up from the sleep, and your hunger & thirst is decrease',
    ['noplayernearby'] = 'No player nearby',
    ['needsomeone'] = 'Need someone closer',
    ['animrefuse'] = 'Animation Refused',
    ['requestemote'] = '~y~ Y ~w~to accept sex, ~r~L ~w~ to refuse sex',
    ['help'] = '%s\nSpeed: %s ~INPUT_COVER~ ~INPUT_TALK~\nUse ~INPUT_WEAPON_WHEEL_PREV~ ~INPUT_WEAPON_WHEEL_NEXT~ to move the position up/down\nUse ~INPUT_ATTACK~ ~INPUT_AIM~ to rotate ped\nUse ~INPUT_CELLPHONE_LEFT~ ~INPUT_CELLPHONE_RIGHT~ ~INPUT_CELLPHONE_UP~ ~INPUT_CELLPHONE_DOWN~ to move ped\nPress ~INPUT_DETONATE~ to teleport ped to you\nPress ~INPUT_FRONTEND_RDOWN~ to confirm.\nPress ~INPUT_FRONTEND_RRIGHT~ to cancel.',
    ['uisleep'] = 'Sleep',
    ['uisex'] = 'Have Sex',
    ['nobednearby'] = 'No Bed Nearby',
    ['setsleepanimation'] = 'Error: there is no sleep animation, set first using /sleepanimation',
    ['setsexanimation'] = 'Error: there is no sex animation, set first using /sexanimation',
    ['maxsexanimation'] = 'Error: max sex animation, if you want to reset use /tablesexanimation',
    ['successdeletesleep'] = 'Success: all sleep animation has been reset',
    ['successdeletesex'] = 'Success: all sex animation has been reset',
    ['successaddsleep'] = 'Success: sleep animation has been set',
    ['successaddsex'] = 'Success: sex animation has been set, sex part: ',
    ['successaddpartner'] = 'Success: Nearby player has your partnersex ',
    ['pregnant_cum_outside'] = 'You are really legend can come outside!',
    ['pregnant_cum_woman'] = 'You not expert for doing this, the woman have your cum in his vagina',
    ['pregnant_cum_woman_safe'] = 'You not expert for doing this, but it safe since you/her using some prevent tools',
    ['pregnant_cum_man'] = 'Eewh, you cum on his ass',
    ['woman_got_pregnant'] = 'The boy not expert at the bed, go buy a test pack',
    ['man_got_pregnant'] = 'Are you insane? Youre a boy how can you get pregnant?',
    ['pregnant_reminder'] = 'Remider: You still pregnant',
    ['readychildbirth'] = 'You are ready for giving a child birth',
    ['pregnant_cantfuck'] = 'You still pregnant, cant fuck!',
    ['condom_activated'] = 'You are using condom',
    ['condom_deactivated'] = 'Condom expired',
    ['result_nopregnant'] = 'Testpack Result: Youre not pregnant',
    ['result_dna'] = 'DNA Result: ',
    ['result_getpartnersex'] = 'Youre safe from getting disease, this is your partner',
    ['use_testpack'] = 'You are using testpack',
    ['use_dnatest'] = 'You are using dna test',
    ['use_mifepristone'] = 'Youre now using a pill who cancel the pregnant',
    ['remove_pregnant'] = 'Pregnant Successfully Deleted',
    ['shower_done'] = 'You are clean now',
    ['text_childbirth'] = '[E] Child Birth',
    ['label_childbirth'] = 'Child Birth',
    ['died_childbirth'] = 'You died because child birth',
    ['not_readychildbirth'] = 'Youre didnt ready for childbirth',
    ['estimate_pregnant'] = 'Estimate time pregnant is: ',
    ['squirt'] = 'Press ~INPUT_CONTEXT~ for squirt',
    ['disease_hiv_first'] = 'Ouch you got hiv, this is because you doesnt use protection!',
    ['disease_hepatitis_first'] = 'Ouch you got hepatitis, this is because you doesnt use protection!',
    ['disease_gonore_first'] = 'Ouch you got gonore',
    ['disease_klamidia_first'] = 'Ouch you got klamidia',
    ['disease_hiv'] = 'You still have: ',
    ['disease_hepatitis'] = 'You still have: ',
    ['disease_gonore'] = 'You still have: ',
    ['disease_klamidia'] = 'You still have: ',
}

function DebugMode(...) -- dont touch
    if Config.Debug then
        print(...)
    end
end

function ReduceHungerAndThirstSleep() -- example
	--TriggerEvent('esx_status:remove', 'hunger', 100)
	--TriggerEvent('esx_status:remove', 'thirst', 100)
	ShowNotification(Strings['wakeup'])
end

function ReduceHungerAndThirstSex() -- example
	--TriggerEvent('esx_status:remove', 'hunger', 100)
	--TriggerEvent('esx_status:remove', 'thirst', 100)
	ShowNotification(Strings['wakeup'])
end

function ReduceStressSleep() -- example
	--if math.random() < 0.1 then
	--	TriggerServerEvent('stress:remove', math.random(100000, 125000))
	--end
end

function ReduceStressSex() -- example
	--if math.random() < 0.1 then
	--	TriggerServerEvent('stress:remove', math.random(100000, 125000))
	--end
end

function loadAnimDict(dict) -- dont touch
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(50)
    end
end

function loadAnimDict(dict) -- dont touch
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Wait(50)
    end
end

function loadAnimSet(dict) -- dont touch
    while not HasAnimSetLoaded(dict) do
        RequestAnimSet(dict)
        Wait(50)
    end
end

function loadModel(model) -- dont touch
    if type(model) == 'number' then
        model = model
    else
        model = GetHashKey(model)
    end
    while not HasModelLoaded(model) do
        RequestModel(model)
        Wait(0)
    end
end

function HelpText(text, sound) -- dont touch
    AddTextEntry(GetCurrentResourceName(), text)
    BeginTextCommandDisplayHelp(GetCurrentResourceName())
    EndTextCommandDisplayHelp(0, 0, (sound == true), -1)
end

function ShowHelpNotification(text) -- dont touch
    SetTextComponentFormat('STRING')
    AddTextComponentString(text)
    DisplayHelpTextFromStringLabel(0, 0, 1, 50)
end

function ShowNotification(msg)
	SetNotificationTextEntry('STRING')
	AddTextComponentString(msg)
	DrawNotification(0, 1)
    -- example using okok
    -- exports['okokNotify']:Alert('Bed', msg, 5000, 'neutral')
end

RegisterNetEvent('SleepOrSex:showNotification') -- dont touch
AddEventHandler('SleepOrSex:showNotification', function(str)
    ShowNotification(str)
end)